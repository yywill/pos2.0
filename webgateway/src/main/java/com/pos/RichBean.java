package com.pos;

import java.io.Serializable;

import javax.annotation.PostConstruct;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;
import javax.faces.context.FacesContext;
import javax.faces.event.ActionEvent;

@ViewScoped
@ManagedBean
public class RichBean implements Serializable {

    private static final long serialVersionUID = -6239437588285327644L;

    private String name;
    private String current;

    @PostConstruct
    public void postContruct() {
        name = "John";
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
    
    public String getCurrent(){
    	return current;
    }
    
    public void setCurrent(String current){
    	this.current = current;
    }
    
    public void updateCurrent(){
    	FacesContext context = FacesContext.getCurrentInstance();
        setCurrent((String) context.getExternalContext()
             .getRequestParameterMap().get("current"));
        
        return ;
    }
    
}