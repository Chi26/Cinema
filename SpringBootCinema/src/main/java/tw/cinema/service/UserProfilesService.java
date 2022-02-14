package tw.cinema.service;



import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import tw.cinema.member.exception.UserNotFoundException;
import tw.cinema.model.Members;
import tw.cinema.repository.*;

@Service
@Transactional
public class UserProfilesService {

	@Autowired
	private UserProfilesRepository userRepo;

	public Members getByName(String username) {

		Optional<Members> op1 = userRepo.findByName(username);

		if (op1.isEmpty()) {

			throw new UserNotFoundException("Can't Find User" + username);
		}

		return op1.get();
	}
	//新增
	public Members createUserProfiles(Members members) {
		String encodedPwd = new BCryptPasswordEncoder().encode(members.getPassword());
		  members.setPassword(encodedPwd);
//		members.setRoles(Arrays.asList(new Role("ROLE_USER")));
		return userRepo.save(members);
	}
	//更新
	public Members updateUserProfiles(Members members) {
		
//		members.setRoles(Arrays.asList(new Role("ROLE_USER")));
		return userRepo.save(members);
	}

	// 檢查帳號是否已存在
	public Members checkByUsername(String username) {
		Members members = userRepo.checkByUsername(username);
		
		if(members != null) {
			return members;
		}
		return null;
	}

	// 寄忘記密碼信
	public Members selectByEmail(String email) {
		Members member = userRepo.selectByEmail(email);

		if (member != null) {
			return member;
		}
		return null;
	}

	// 修改密碼
	public Members changePassword(String email, String password) {

		Members member = userRepo.changePassword(email, password);

		if (member != null) {
			return member;
		}
		return null;
	}
}

