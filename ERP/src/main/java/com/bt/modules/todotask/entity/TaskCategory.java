package com.bt.modules.todotask.entity;

import java.io.Serializable;
import java.util.List;

/**
 * author fanjinyuan.
 */
public class TaskCategory implements Serializable{

    private static final long serialVersionUID = 1L;

    private String cateName;
    private int amount;
    private List<TodoTask> tasks;

    public String getCateName() {
        return cateName;
    }

    public void setCateName(String cateName) {
        this.cateName = cateName;
    }


    public List<TodoTask> getTasks() {
        return tasks;
    }

    public void setTasks(List<TodoTask> tasks) {
        this.tasks = tasks;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }


}
