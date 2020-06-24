package bean;

import java.util.List;

public class Page<T> {
    private  int pageNo;//当前是第几页  （传入的参数）
    private  int totalPage;//总页数   （计算得到)
    private  int totalCount;//总记录数  （查询得到)
    private  int pageSize=4;//每页显示的记录数
    private int index;//指定开始查询的索引  （计算得到)
    private  boolean hasPrev;//是否有上一页  （判断得到)
    private  boolean hasNext;//是否有下一页  (判断得到)
    private List<Content> pageData;//分页的实际数据 （查询出来设置进去)

    public Page() {
    }

    public Page(int pageNo, int totalPage, int totalCount, int pageSize, int index, boolean hasPrev, boolean hasNext, List<Content> pageData) {
        this.pageNo = pageNo;
        this.totalPage = totalPage;
        this.totalCount = totalCount;
        this.pageSize = pageSize;
        this.index = index;
        this.hasPrev = hasPrev;
        this.hasNext = hasNext;
        this.pageData = pageData;
    }

    public Page(int pageNo, int totalPage, int totalCount, int pageSize, int index, List<Content> pageData) {
        this.pageNo = pageNo;
        this.totalPage = totalPage;
        this.totalCount = totalCount;
        this.pageSize = pageSize;
        this.index = index;
        this.pageData = pageData;
    }

    public int getPageNo() {
        pageNo=pageNo>0?pageNo:1;
        pageNo=pageNo>getTotalPage()?getTotalPage():pageNo;
        return pageNo;
    }

    public void setPageNo(int pageNo) {

        this.pageNo = pageNo;
    }
     //获取总页数
    public int getTotalPage() {
        //计算实际的totalPage
        int t=getTotalCount()/getPageSize();
        if (!(getTotalCount()%getPageSize()==0)){
            t=t+1;
        }
        return t;
    }

    /*public void setTotalPage(int totalPage) {
        this.totalPage = totalPage;
    }*/

    public int getTotalCount() {
        return totalCount;
    }

    public void setTotalCount(int totalCount) {
        this.totalCount = totalCount;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }
     //计算得出索引值
    public int getIndex() {
        int ind=(getPageNo()-1)*getPageSize();
        int i=ind>0?ind:1;
        this.index=i;
        return index;
    }

     //判断是否有上一页
    public boolean isHasPrev() {
        return getPageNo()>1;
    }



    public boolean isHasNext() {
        //判断是否有下一页 ，根据当前页面
        return getPageNo()<getTotalPage();
    }


    public List<Content> getPageData() {
        return pageData;
    }

    public void setPageData(List<Content> pageData) {
        this.pageData = pageData;
    }

    @Override
    public String toString() {
        return "Page{" +
                "pageNo=" + pageNo +
                ", totalPage=" + totalPage +
                ", totalCount=" + totalCount +
                ", pageSize=" + pageSize +
                ", index=" + index +
                ", hasPrev=" + hasPrev +
                ", hasNext=" + hasNext +
                ", pageData=" + pageData +
                '}';
    }
}
