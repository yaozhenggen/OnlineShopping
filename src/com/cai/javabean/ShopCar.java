package com.cai.javabean;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;

import com.cai.Books;
import com.cai.Tools;

public class ShopCar {
	private ArrayList buylist;
	public ArrayList getBuylist() {
		return buylist;
	}
	public void setBuylist(ArrayList buylist) {
		this.buylist = buylist;
	}
	public void addItem(Books single){
		if(single!=null){
			if(buylist.size()==0){
				Books temp=new Books();
				temp.setBookname(single.getBookname());
				temp.setAuthor(single.getAuthor());
				temp.setPression(single.getPression());
				temp.setPrice(single.getPrice());
				temp.setNum(single.getNum());
				buylist.add(temp);
			}
			else{
				int i=0;
				for(i=0;i<buylist.size();i++){
					Books temp=(Books)buylist.get(i);
					if(temp.getBookname().equals(single.getBookname())){
						temp.setNum(temp.getNum()+1);
						break;
					}
				}
				if(i>=buylist.size()){
					Books temp=new Books();
					temp.setBookname(single.getBookname());
					temp.setAuthor(single.getAuthor());
					temp.setPression(single.getPression());
					temp.setPrice(single.getPrice());
					temp.setNum(single.getNum());
					buylist.add(temp);
				}
			}
		}
	}
	public void removeItem(String name) {
		for(int i=0;i<buylist.size();i++){
			Books temp=(Books)buylist.get(i);
			if(temp.getBookname().equals(name)){
				if(temp.getNum()>1){
					temp.setNum(temp.getNum()-1);
					break;
				}
				else if(temp.getNum()==1){
					buylist.remove(i);
				}
			}
		}
	}
}

