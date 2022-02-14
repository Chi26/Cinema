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
import tw.cinema.repository.FoodListRepository;


@Service
@Transactional
public class FoodListService {
	
	@Autowired
    private  FoodListRepository FLRepo;
	
	public FoodListBean findByFood(String  food) {
		Optional<FoodListBean> FLBean = FLRepo.findByFood(food);
		System.out.println("這是DAO的FLB"+FLBean);
		
		if(FLBean.isPresent()) {
			return FLBean.get();
		}
		
		return null;
	}
	
	public FoodListBean findById(int id) {
		Optional<FoodListBean> FLBean = FLRepo.findById(id);
		
		if(FLBean.isPresent()) {
			return FLBean.get();
		}
		
		return null;
	}
	
	public List<FoodListBean> findAll(){
		return FLRepo.findAll();
	}
	
	public Page<FoodListBean> findAllByPage(Pageable pageable){
		return FLRepo.findAll(pageable);
	}
	
	public FoodListBean insert(FoodListBean FLBean) {
		return FLRepo.save(FLBean);
	}
	
	public FoodListBean update(FoodListBean FLBean) {
		System.out.println(FLBean);
		System.out.println("進入更新");
		return FLRepo.save(FLBean);
	}
		
	public void deleteByFood(String food) {
		FLRepo.deleteByFood(food);
			
	}
	
	public void deleteById(int id) {
		FLRepo.deleteById(id);
			
	}
	
	//找全部ID和數量	
	public List<Map<String, Object>> findQ(){
		return FLRepo.findQ( null, null);
	}

	//扣庫存後
	public List<FoodListBean> renew() {
		return FLRepo.renew();
	}

	
	public void update2( String food,int price ,int pcs, String filename,byte[] picture ,String pic,int id){
		FLRepo.update2(food,price,pcs,filename,picture,pic,id);
	}
	

}
