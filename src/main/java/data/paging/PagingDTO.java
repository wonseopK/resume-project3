package data.paging;


import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class PagingDTO {
	private int startPage;
	private int endPage;
	private int totalCount;
	private int currentPage = 1;
	private int no;
	private int perPage = 2; //한페이지에 보여질 글의 갯수
	private int totalPage; //총 페이지수
	private int start; //각페이지에서 불러올 db의 시작번호
	private int perBlock = 5; //몇개의 페이지번호씩 표현할것인가
	
	public void page(int currentPage, int totalCount) {
		this.totalCount = totalCount;
		//총페이지 갯수 구하기
		totalPage = totalCount/perPage + (totalCount%perPage == 0 ? 0 : 1);
		
		//각 블럭의 시작페이지
		startPage = (currentPage-1)/perBlock*perBlock+1;
		endPage = startPage+perBlock-1;
		
		if(endPage>totalPage){
			endPage = totalPage;
		}
		
		//각 페이지에서 불러올 시작번호
		start = (currentPage-1)*perPage; //오라클은 첫번이1이라 1더해야함
	}
}
