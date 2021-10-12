package com.kalyb.mvc.services;

import java.util.List;

import org.springframework.stereotype.Service;

import com.kalyb.mvc.models.Expense;
import com.kalyb.mvc.repos.ExpenseRepository;

@Service
public class ExpenseService {
	private final ExpenseRepository expenseRepository;
	
	public ExpenseService(ExpenseRepository expenseRepo) {
		this.expenseRepository = expenseRepo;
	}
	
	public List<Expense> getAll(){
		return expenseRepository.findAll();
	}

    public Expense createExpense(Expense e) {
        return expenseRepository.save(e);
    }
}
