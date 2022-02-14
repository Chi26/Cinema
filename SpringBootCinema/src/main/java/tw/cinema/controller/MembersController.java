package tw.cinema.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.http.MediaType;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.supercsv.io.CsvBeanWriter;
import org.supercsv.io.ICsvBeanWriter;
import org.supercsv.prefs.CsvPreference;

import tw.cinema.model.Members;
import tw.cinema.service.MembersService;

@Controller
@SessionAttributes(names = { "totalPages", "totalElements" })
@RequestMapping(path = "/admin",method = {RequestMethod.PUT,RequestMethod.DELETE})
public class MembersController {

	@Autowired
	private MembersService memService;

	// 測試用
	@GetMapping(path = "/hello")
	public String hello() {
		return "Hello";
	}

	// 會員主頁
	@GetMapping(path = "/managermembers")
	public String processMembersMain() {
		return "members/backstage/membersMain";
	}

	// 用id尋找全部
	@PostMapping(path = "/findall.controller")
	@ResponseBody
	public List<Members> processFindAll() {
		return memService.findAll();
	}

	// 分頁找全部
	@PostMapping(path = "/findallbypage/{pageNo}")
	@ResponseBody
	public List<Members> processFindAllByPage(@PathVariable("pageNo") int pageNo, Model model) {
		int pageSize = 7;
		System.out.println("++++++++++");
		Pageable pageable = PageRequest.of(pageNo - 1, pageSize);
		Page<Members> page = memService.findAllByPage(pageable);

		model.addAttribute("totalPages", page.getTotalPages());
		model.addAttribute("totalElements", page.getTotalElements());

		return page.getContent();

	}

	// 新增會員主畫面
	@GetMapping(path = "/insertmain")
	public String insertMainAction(Model m) {
		Members members = new Members();
		m.addAttribute("members", members);
		return "members/backstage/memberInsert";
	}

	// 新增會員
	@PostMapping("/insertmember")
	public String processInsertMember(@ModelAttribute("members") Members members, Model m) {

		String encodedPwd = new BCryptPasswordEncoder().encode(members.getPassword());
		members.setPassword(encodedPwd);

		memService.insert(members);
		m.addAttribute("members", members);

		return "memberSuccess";
	}

	// 選取單一會員
	@GetMapping(path = "/selectmember/{account_No}")
//	@GetMapping(path = "/managermembers/{account_No}")
	public String processSelectAction(@ModelAttribute("members") Members members, ModelMap modelMap, Model m) {
		
		m.addAttribute("members", memService.findById(members.getAccount_No()));

		return "members/backstage/updateMember";
	}

	// 修改會員資料
	@PostMapping(path = "/selectmember/updatemember")
//	@PutMapping(path = "/managermembers/{account_No}")
	public String processUpdateAction(@ModelAttribute("members") Members members, Model m) {
		System.out.println("Account_No:" + members.getAccount_No() + members.getName());
		memService.update(members);

		return "members/backstage/memberSuccess";
	}

	// 刪除會員資料
	@GetMapping(path = "/deletemember/{account_No}")
	public String processDeleteAction(@ModelAttribute("members") Members members) {

		System.out.println("Account_No:" + members.getAccount_No());
		memService.deleteById(members.getAccount_No());

		return "members/backstage/memberSuccess";
	}
	// 統計會員性別
	 @GetMapping(path = "/statBirthdayForChart",produces= MediaType.APPLICATION_JSON_VALUE)
	 @ResponseBody
	 public List<Integer> statGenderAction(){
	  
	  System.out.println("建立性別List");
	  List<Integer> targetList = new ArrayList<Integer>();

	  List<Object[]> male = memService.statGender("1");
	  List<Object[]> female = memService.statGender("2");
	  
	  System.out.println("取得性別Size");
	  Integer mSize = male.size();
	  Integer fSize = female.size();

	  System.out.println(mSize);
	  System.out.println(fSize);
	  
	  targetList.add(mSize);
	  targetList.add(fSize);
	  
	  return targetList;
	 }

	 //統計會員居住地
	 @GetMapping(path = "/statAddressForChart",produces= MediaType.APPLICATION_JSON_VALUE)
	 @ResponseBody
	 public List<Integer> statAddressAction(){
	  
	  System.out.println("建立地址List");
	  List<Integer> targetList = new ArrayList<Integer>();

	  List<Object[]> NTPC = memService.statAddress("新北市");
	  List<Object[]> TPE = memService.statAddress("台北市");
	  List<Object[]> TYN = memService.statAddress("桃園市");
	  List<Object[]> HSZ = memService.statAddress("新竹市");
	  
	  System.out.println("取得地址Size");
	  Integer ntpcSize = NTPC.size();
	  Integer tpeSize = TPE.size();
	  Integer tynSize = TYN.size();
	  Integer hszSize = HSZ.size();

	  System.out.println(ntpcSize);
	  System.out.println(tpeSize);
	  System.out.println(tynSize);
	  System.out.println(hszSize);
	  
	  targetList.add(ntpcSize);
	  targetList.add(tpeSize);
	  targetList.add(tynSize);
	  targetList.add(hszSize);
	  
	  return targetList;
	 }
	 
	//統計會員年齡
	 @GetMapping(path = "/statAgeForChart",produces= MediaType.APPLICATION_JSON_VALUE)
	 @ResponseBody
	 public List<Integer> statAgeAction(){
	  
	  System.out.println("建立年齡List");
	  List<Integer> targetList = new ArrayList<Integer>();
	  
	  List<Object[]> seventy = memService.statAge("1950","1960");
	  List<Object[]> sixty = memService.statAge("1960","1970");
	  List<Object[]> fifity = memService.statAge("1970","1980");
	  List<Object[]> fourty = memService.statAge("1980","1990");
	  List<Object[]> thrity = memService.statAge("1990","2000");
	  List<Object[]> twenty = memService.statAge("2000","2010");
	  
	  System.out.println("取得年齡Size");
	  Integer seventySize = seventy.size();
	  Integer sixtySize = sixty.size();
	  Integer fifitySize = fifity.size();
	  Integer fourtySize = fourty.size();
	  Integer thritySize = thrity.size();
	  Integer twentySize = twenty.size();
	  
	  System.out.println(seventySize);
	  
	  targetList.add(seventySize);
	  targetList.add(sixtySize);
	  targetList.add(fifitySize);
	  targetList.add(fourtySize);
	  targetList.add(thritySize);
	  targetList.add(twentySize);
	  
	 
	  return targetList;
	 }
	 
	 //轉成CSV檔
	 @GetMapping(path = "/export")
	 public void exportToCsv(HttpServletResponse response) throws IOException {
	  response.setContentType("text/csv ; charset=UTF-8");
	  String fileName = "users.csv";
	  
	  String headerKey ="Content-Disposition"; 
	  String headerValue ="attachment; filename = "+fileName; 
	  
	  response.setHeader(headerKey, headerValue);
	  //找全部使用者
	  List<Members> listUsers = memService.findAll(); 
	  
	  
	  
	  //使用csv writer
	  ICsvBeanWriter csvWriter = new CsvBeanWriter(response.getWriter(), CsvPreference.STANDARD_PREFERENCE);
	 
	  //csv裡的第一行
	  String[] csvHeader = {"會員編號","帳號","姓名","密碼","信箱","身分證字號","聯絡資訊","地址","生日","角色"};
	  //對應bean name
	  String[] nameMapping = {"account_No","username","name","password","email","id","phone","address","birthday","role"};
	  
	  csvWriter.writeHeader(csvHeader);//title
	  
	  for(Members user : listUsers) {
	   csvWriter.write(user, nameMapping);
	  }
	  
	  //關閉csvWriter
	  csvWriter.close(); 
	 }

}
