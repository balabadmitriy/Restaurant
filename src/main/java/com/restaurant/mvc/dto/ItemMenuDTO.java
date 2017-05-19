package com.restaurant.mvc.dto;

import java.io.Serializable;
import java.util.List;

public class ItemMenuDTO implements Serializable {
    List<String> nameMenu;
    List<String> roleMenu;

    public List<String> getNameMenu() {
        return nameMenu;
    }

    public void setNameMenu(List<String> nameMenu) {
        this.nameMenu = nameMenu;
    }

    public List<String> getRoleMenu() {
        return roleMenu;
    }

    public void setRoleMenu(List<String> roleMenu) {
        this.roleMenu = roleMenu;
    }

    @Override
    public String toString() {
        return "ItemMenuDTO{" +
                "nameMenu=" + nameMenu.size() +
                ", roleMenu=" + roleMenu.size() +
                '}';
    }
}
