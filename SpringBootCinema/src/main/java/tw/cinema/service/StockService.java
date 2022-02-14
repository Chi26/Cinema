package tw.cinema.service;

import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import tw.cinema.model.Stock;
import tw.cinema.repository.StockRepository;

@Service
@Transactional
public class StockService {
	
	@Autowired
    private  StockRepository StRepo;
	
	public Stock findById(int id) {
		Optional<Stock> FLBean = StRepo.findById(id);
		
		if(FLBean.isPresent()) {
			return FLBean.get();
		}
		
		return null;
	}
	
	public List<Stock> findAll(){
		return StRepo.findAll();
	}
	
	public Page<Stock> findAllByPage(Pageable pageable){
		return StRepo.findAll(pageable);
	}
	
	public Stock insert(Stock Stock) {
		return StRepo.save(Stock);
	}
	
	public Stock update(Stock Stock) {
		System.out.println(Stock);
		System.out.println("進入更新");
		return StRepo.save(Stock);
	}

	
	public void deleteById(int id) {
		StRepo.deleteById(id);
			
	}
	
	//找全部ID和數量	
	public List<Map<String, Object>> findQ2(){
		return StRepo.findQ2( null, null, null, null);
	}
//
//	//扣庫存後
//	public List<Stock> desQ() {
//		return StRepo.desQ();
//	}
//
//	
//	public void updateQ( String food,int pcs, int increase,int decrease ,int id){
//		StRepo.updateQ(food,pcs, increase, decrease ,id);
//	}
	
//	public void updateQ( Object object,Object object2, Object object3 ,Object object4){
//		StRepo.updateQ(object,object2,  object3 ,object4);
//	}
	
	public void updateQ( String food,int pcs, int increase,int decrease,String date ,int id){
		StRepo.updateQ(food,pcs,increase,decrease,date,id);
	}
	
	public List<Map<String, Object>> findAllbyId(int id){
		return StRepo.findAllbyId(id);
	}

	public List<Stock> findAllDESC(){
		return StRepo.findAllDESC();
	}

}
