package com.kalyb.mvc.controllers;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.kalyb.mvc.models.Expense;
import com.kalyb.mvc.services.ExpenseService;

@Controller
public class PokeController {
	@Autowired
	ExpenseService expenseService;
	
	@GetMapping(value="/expenses")
	public String showAll(Model model, @ModelAttribute("expense") Expense expense) {
		List<Expense> allExpenses = expenseService.getAll();
		model.addAttribute("allExpenses", allExpenses);
		return "index.jsp";
	}
	
	@PostMapping(value="/expenses")
	public String create(@Valid @ModelAttribute("expense") Expense expense, BindingResult result) {
		if (result.hasErrors()) {
			return "index.jsp";
		} else {
			expenseService.createExpense(expense);
			return "redirect:/expenses";
		}
	}
}
