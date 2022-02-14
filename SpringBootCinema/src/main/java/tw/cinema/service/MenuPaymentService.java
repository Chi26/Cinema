package tw.cinema.service;

import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import tw.cinema.model.MenuPayment;
import tw.cinema.model.Stock;
import tw.cinema.repository.MenuPaymentRepository;

@Service
@Transactional
public class MenuPaymentService {
	
	@Autowired
    private  MenuPaymentRepository MpRepo;
	
	public MenuPayment findById(int id) {
		Optional<MenuPayment> FLBean = MpRepo.findById(id);
		
		if(FLBean.isPresent()) {
			return FLBean.get();
		}
		
		return null;
	}
	
	public MenuPayment findByAccount(int account) {
		Optional<MenuPayment> FLBean = MpRepo.findById(account);
		
		if(FLBean.isPresent()) {
			return FLBean.get();
		}
		
		return null;
	}
	
	public List<MenuPayment> findAll(){
		return MpRepo.findAll();
	}
	
	public Page<MenuPayment> findAllByPage(Pageable pageable){
		return MpRepo.findAll(pageable);
	}
	
	public MenuPayment insert(MenuPayment mp) {
		return MpRepo.save(mp);
	}
	
	public MenuPayment update(MenuPayment mp) {
		System.out.println(mp);
		System.out.println("進入更新");
		return MpRepo.save(mp);
	}

	
	public void deleteById(int id) {
		MpRepo.deleteById(id);
			
	}
	

	public List<Map<String, Object>> findMyAccount(int account){
		return MpRepo.findMyAccount(account);
	}
}
