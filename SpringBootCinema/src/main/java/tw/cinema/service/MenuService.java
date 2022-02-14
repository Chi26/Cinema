package tw.cinema.service;

import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import tw.cinema.model.FoodListBean;
import tw.cinema.model.Menu;
import tw.cinema.repository.FoodListRepository;
import tw.cinema.repository.MenuRepository;

@Service
@Transactional
public class MenuService {
	@Autowired
    private  MenuRepository MeRepo;
	
	public Menu findByFood(String  food) {
		Optional<Menu> FLBean = MeRepo.findByFood(food);
		
		if(FLBean.isPresent()) {
			return FLBean.get();
		}
		
		return null;
	}
	
	public Menu findById(int foodno) {
		Optional<Menu> FLBean = MeRepo.findById(foodno);
		
		if(FLBean.isPresent()) {
			return FLBean.get();
		}
		
		return null;
	}
	
	public List<Menu> findAll(){
		return MeRepo.findAll();
	}
	
	public Page<Menu> findAllByPage(Pageable pageable){
		return MeRepo.findAll(pageable);
	}
	
	public Menu insert(Menu Menu) {
		return MeRepo.save(Menu);
	}
	
	public Menu update(Menu Menu) {
		return MeRepo.save(Menu);
	}
		
	public void deleteByFood(String food) {
		MeRepo.deleteByFood(food);
			
	}
	
	public void deleteById(int foodno) {
		MeRepo.deleteById(foodno);			
	}
	
	//找全部ID	
	public List<Map<String, Object>> findAllId(){
		return MeRepo.findAllId( null);
	}
	
	//找全部ID和數量	
	public List<Map<String, Object>> findQ(){
		return MeRepo.findQ( null, null);
	}
	
	public void deleteByAccount(int account) {
		MeRepo.deleteByAccount(account);			
	}
	

}
