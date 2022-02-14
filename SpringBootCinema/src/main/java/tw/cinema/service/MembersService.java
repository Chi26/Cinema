package tw.cinema.service;
import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Example;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import tw.cinema.model.Members;
import tw.cinema.repository.MembersRepository;


@Service
@Transactional
public class MembersService {

	@Autowired
	private MembersRepository mRepos;
		
	
	//用id尋找全部
	public List<Members> findAll(){
		return mRepos.findAll();
	}
	
	//分頁找全部
	public Page<Members> findAllByPage(Pageable pageable){
		return mRepos.findAll(pageable);
	}
	
	//用id尋找單個
	public Members findById(int account_No) {
		Optional<Members> optional = mRepos.findById(account_No);
		
		if(optional.isPresent()) {
			return optional.get();
		}
		return null;
	}
	
	//新增
	public Members insert(Members members) {
		return mRepos.save(members);
	}
	
	//修改
	public Members update(Members members) {
		return mRepos.save(members);
	}
	
	//刪除
	public void deleteById(int account_No) {
		mRepos.deleteById(account_No);
	}
	
	//統計會員性別
	 public List<Object[]> statGender(String id){
	  return  mRepos.statGender(id);
	 }

	 //統計會員居住地
	 public List<Object[]> statAddress(String address){
	  return mRepos.statAddress(address);
	 }
	 
	// 統計會員年齡
	 public List<Object[]> statAge(String start, String end) {
	  return mRepos.statAge(start, end);
	 }

	
}
