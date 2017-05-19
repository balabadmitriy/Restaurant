package com.restaurant.mvc.repository.custom;

import com.restaurant.mvc.domain.Dish;
import com.restaurant.mvc.domain.Order;
import com.restaurant.mvc.domain.Order_;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.ListJoin;
import javax.persistence.criteria.Root;
import java.util.List;

@Component
public class DishRepositoryImpl implements DishRepositoryCustom{

    @PersistenceContext
    EntityManager entityManager;



    @Override
    @Transactional
    public List<Dish> getDishesByOrder(Long id) {
        CriteriaBuilder cb = entityManager.getCriteriaBuilder();
        CriteriaQuery<Dish> query = cb.createQuery(Dish.class);
        Root<Order> root = query.from(Order.class);

        query.where(cb.equal(root.get(Order_.id),id));
        ListJoin<Order,Dish> dishes = root.join(Order_.dishes);
        CriteriaQuery<Dish> cq = query.select(dishes);
        TypedQuery<Dish> dishTypedQuery = entityManager.createQuery(cq);
        return dishTypedQuery.getResultList();
    }
}
