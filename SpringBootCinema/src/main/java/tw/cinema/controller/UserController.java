package tw.cinema.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;



import tw.cinema.model.Members;
import tw.cinema.service.MailService;
import tw.cinema.service.UserProfilesService;

@Controller
@SessionAttributes("members")
public class UserController {

	@Autowired
	private UserProfilesService userService;

	@Autowired
	private MailService mailService;

//	@GetMapping(path = "/")
//	public String mainPage() {
//		return "Home";
//	}

	// 會員註冊主畫面
	@GetMapping("/save")
	public String insertMainAction(Members members) throws Exception {

		
		return "members/forestage/userCreate";
	}

	// 會員註冊
	@PostMapping(path = "/save")
	public String processInsertAction(Members members, BindingResult bindingResult, Model model) throws Exception {

		System.out.println("111111");
		System.out.println("id:" + members.getId());

		if (bindingResult.hasErrors()) {
			// 如果有錯誤訊息->停留在原頁面
			System.out.println("2222222");
			return "members/forestage/userCreate";
		}

		// 錯誤訊息
		Map<String, String> errors = new HashMap<String, String>();
		model.addAttribute("errors", errors);
		// 正規化條件
		String restriction = "^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{2,10}$";
		String restrictionPhone = "^[(0-9_)]{10}$";

		// 確認帳戶是否已經存在
		Members checkMember = userService.checkByUsername(members.getUsername());
		System.out.println(members.getUsername() + members.getAccount_No());

		// 取得前端輸入參數
		String mUsername = members.getUsername();
		String mName = members.getName();
		String mPassword = members.getPassword();
		String mEmail = members.getEmail();
		String mPhone = members.getPhone();
		String mId = members.getId();

		System.out.println("一");

		if (checkMember != null) {
			System.out.println("二");

			// 錯誤訊息:帳戶已存在${errors.username}
			if (checkMember.getUsername().equals(mUsername)) {
				errors.put("username", "帳號已存在");
			}

			// 錯誤訊息:密碼已被使用${errors.password}
			if (checkMember.getPassword().equals(mPassword)) {
				errors.put("password", "密碼已被使用");
			}

			// 錯誤訊息:信箱已被註冊->存入${errors.email}
			if (checkMember.getEmail().equals(mEmail)) {
				errors.put("email", "信箱已被使用");
			}

			// 錯誤訊息:聯絡資訊已被註冊->存入${errors.phone}
			if (checkMember.getPhone().equals(mPhone)) {
				errors.put("phone", "聯絡資訊已被使用");
			}

			// 錯誤訊息:身分證字號已被註冊->存入${errors.id}
			if (checkMember.getId().equals(mId)) {
				errors.put("id", "身分證字號已被使用");
			}
		}

		System.out.println("三");

		// 帳號不可為空且符合正規化
		if (mUsername == null || mUsername.trim().length() == 0) {
			errors.put("username", "帳號不可為空，請輸入帳號");
		} else if (!mUsername.matches(restriction)) {
			errors.put("username", "帳號格式請為英文字母、數字和_ ,且長度必需在2到10之間");
		}

		// 姓名不可為空
		if (mName == null || mName.trim().length() == 0) {
			errors.put("name", "會員姓名不可為空，請輸入會員姓名");
		}

		// 密碼不可為空且符合正規化
		if (mPassword == null || mPassword.trim().length() == 0) {
			errors.put("password", "密碼不可為空，請輸入密碼");
		} else if (!mPassword.matches(restriction)) {
			errors.put("password", "密碼格式請為英文字母、數字和_,且長度必需在2到10之間");
		}

		// 信箱不可為空且符合正規化
		if (mEmail == null || mEmail.trim().length() == 0) {
			errors.put("email", "Email不可為空，請輸入Email");
		} else if (!mEmail.contains("@")) {
			errors.put("email", "請輸入正確的Email格式");
		}

		// 聯絡資訊不可為空且符合正規化
		if (mPhone == null || mPhone.trim().length() == 0) {
			errors.put("phone", "聯絡資訊不可為空，請輸入聯絡資訊");
		} else if (!mPhone.trim().matches(restrictionPhone)) {
			errors.put("phone", "請輸入正確的聯絡資訊");
		}

		// 身分證字號不可為空
		if (mId == null || mId.trim().length() == 0) {
			errors.put("id", "身分證字號不可為空，請輸入身分證字號");
		}
		System.out.println("四");
		if (errors.isEmpty()) {

			// 如果無錯誤訊息->新增會員->跳轉成功頁面
			userService.createUserProfiles(members);
			// 寄註冊成功信件
			mailService.SendRegistrationMail(members);

			System.out.println("33333333");

			return "Home";
		}

		return "members/forestage/userCreate";
	}

	// 會員修改
	@GetMapping("/users/edit")
	public String showUpdateForm(Model model,HttpServletRequest request) {
		HttpSession session = request.getSession();
		Members members = (Members)session.getAttribute("members");
		System.out.println("username from seession in usercontroller:"+members.getUsername());
		
//		Members newMember = userService.checkByUsername(members.getUsername());
//
//		model.addAttribute("members", newMember);
		return "members/forestage/userUpdate2";
	}

	@PostMapping("/users/update")
	public String updateUserProfiles(@ModelAttribute("members") Members members,BindingResult result) throws Exception {
		
		System.out.println("一一一");
		
		if (result.hasErrors()) {
			members.setUsername(members.getUsername());
			System.out.println("二二二");
			return "members/forestage/userUpdate";
		}
		System.out.println("三三三");
		System.out.println("username for update" + members.getUsername());

		userService.updateUserProfiles(members);

		return "Home";
	}

	// 利用email寄忘記密碼信件
	@GetMapping(path = "/sendForgotMail")
	public String sendForgotMail(@RequestParam("email") String email, Model model, HttpSession session) {

		System.out.println("selectByEmail start" + email);
		Members members = userService.selectByEmail(email);
		System.out.println("sending pwd email start" + members.getEmail());
		mailService.SendForgotMail(members);
		System.out.println("sending pwd email end");
		model.addAttribute("member", members);

		return "Home";
	}

	// 忘記密碼檢查是否有此帳號
	@GetMapping("/memberpassord.cotroller")
	public String vergeetPassword(@RequestParam("username") String username) {
		System.out.println("username:" + username);
		Members byName = userService.checkByUsername(username);
		System.out.println("忘記密碼:" + byName.getEmail());
		// 判斷帳號是否存在
		if (byName.getUsername() != null) {
			mailService.SendForgotMail(byName);
		}
		return "/login";
	}

	// 點擊信件
	@GetMapping("onClickEmail.controller")
	public String username(@RequestParam("username") String username, Model m) {
		System.out.println("點擊信件" + username);
		m.addAttribute("username", username);
		return "members/forestage/resetpwd";
	}

	// 進入修改密碼
	@PostMapping("/vergeetpassword.controller")
	
	public String vergeetPassword2(@RequestParam("username") String username,
			@RequestParam("password") String password) {
		// 判斷密碼是否相同
		System.out.println("password:" + password);
		Members checkMember = userService.checkByUsername(username);
		System.out.println(checkMember.getPassword());

		if (checkMember != null) {
			System.out.println("進入修改密碼");
			// 設定新密碼加密儲存
			String encodePwd = new BCryptPasswordEncoder().encode(password);
			checkMember.setPassword(encodePwd);
			// 儲存新密碼
			Members newMember = userService.updateUserProfiles(checkMember);
			System.out.println(newMember);
			System.out.println("修改成功");

			return "Home";
		}
			return "login/page";

	}
	
	
}


