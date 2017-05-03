package com.restaurant.mvc.service;

import com.restaurant.mvc.domain.Dish;
import com.restaurant.mvc.domain.Order;
import com.restaurant.mvc.dto.ClientDTO;
import com.restaurant.mvc.repository.ClientRepository;
import com.restaurant.mvc.repository.OrderRepository;
import com.restaurant.mvc.repository.PaymentMethodRepository;
import com.restaurant.mvc.repository.StatusRepository;
import com.restaurant.mvc.repository.custom.DishRepositoryCustom;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.http.HttpSession;
import java.util.Comparator;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

@Service
public class OrderService {

    @Autowired
    OrderRepository orderRepository;

    @Autowired
    PaymentMethodRepository paymentRepository;

    @Autowired
    BagService bagService;

    @Autowired
    ClientRepository clientRepository;

    @Autowired
    DishRepositoryCustom dishRepositoryCustom;

    @Autowired
    StatusRepository statusRepository;

    public List<Order> addOrderAndGetOrder(HttpSession session, ClientDTO clientDTO){
        List<String> bags = (List<String>) session.getAttribute("sessionReq");
        String payment = (String) session.getAttribute("payment");
        String del = (String) session.getAttribute("del");
        if(del != null && del.equals("1")) {
            session.removeAttribute("sessionReq");
            session.removeAttribute("payment");
        }
        if (bags != null && (del != null && del.equals("1")))
            addOrder(bags,clientDTO,payment);

        return getOrder(clientDTO.getLogin());
    }

    public List<Order> getOrder(){
        return orderRepository.findAll(new Sort(Sort.Direction.DESC,"dateOrder"));
    }

    private void addOrder(List<String> bags, ClientDTO clientDTO, String payment) {
        Order order = new Order();

        List<Dish> dishes = bagService.getDishes(bags);
        System.out.println("----------- " + payment);
        order.setPaymentMethod(paymentRepository.getByName(payment));
        order.setDishes(dishes);
        order.setOrderForClient(clientRepository.findUserByLogin(clientDTO.getLogin()));
        order.setSum(sumPrice(dishes));
        order.setAmountDishes(dishes.size());

        orderRepository.save(order);
    }

    private Long sumPrice(List<Dish> dishes) {
        Long sum = 0l;
        for (Dish d :
                dishes) {
            sum += d.getPrice();
        }
        return sum;
    }

    public List<Order> getOrder(String login) {
        return orderRepository.findAllByIdClient(clientRepository.findUserByLogin(login).getId());
    }

    public Map<Order,List<Dish>> getOrderDishes(){
        List<Order> orders = getOrder();
        Map<Order,List<Dish>> mapOrderDish = new TreeMap<>(new Comparator<Order>() {
            @Override
            public int compare(Order order, Order t1) {
                return order.getDateOrder().compareTo(t1.getDateOrder());
            }
        });
        orders.forEach(order -> mapOrderDish.put(order,dishRepositoryCustom.getDishesByOrder(order.getId())));
        return mapOrderDish;
    }

    public Order getOrderById(Long id) {
        return orderRepository.findById(id);
    }

    @Transactional
    public void setStatusToOrder(String  id, String status) {
        Order order = getOrderById(Long.valueOf(id));
        order.setStatusOrder(statusRepository.findByName(status));
    }
}
