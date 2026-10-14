BANKING SCENARIO – QUESTIONS

Basic + WHERE + Operators (1–15)


1.Retrieve all accounts with balance greater than 20,000.
--- select*
    from accounts
    where balance>20000;

2.Find customers who live in Chennai.
---select*
   from customers
   where city='Chennai';

3.Display accounts with balance between 20,000 and 50,000.
---select*
   from accounts
   where balance between 20000 and 50000;

4.Find customers whose names start with 'J'.
---select*
   from customers
   where name like'j%';

5.Retrieve accounts of type 'Savings' or 'Current'.
---select*
   from accounts
   where account_type in('Savings' , 'Current');

6.Display accounts that are not 'Savings'.
---select*
   from accounts
   where account_type not like 'Savings';

7.Find customers whose names contain the letter 'a'.
---select*
   from customers
   where name like '%a%';

8.Retrieve accounts with balance less than or equal to 30,000.
---select*
   from accounts
   where balance <=30000;

9.Find customers who are not from Madurai.
---select*
   from customers
   where city not like 'Madurai';
   or
---select*
   from customers
   where city !='madurai';

10.Display accounts where balance is not between 10,000 and 40,000.
---select*
   from accounts
   where balance not between 10000 and 40000;

11.Retrieve customers whose names end with 'i'.
---select*
   from customers
   where name like '%i';

12.Find accounts with balance equal to 50,000.
---select*
   from accounts
   where balance =50000;

13.Display customers whose city is either Chennai or Salem.
---select*
   from customers
   where city not in('Chennai','salem');

14.Find accounts with balance greater than 10,000 and less than 40,000.
---select*
   from accounts
   where balance>10000 and balance<40000;
  or
---select*
   from accounts
   where balance between 10001 and 39000;

15.Retrieve accounts where account type is not in ('Current').
---select*
   from accounts
   where account_type not like 'current';



ORDER BY (16–18)

16. Display all accounts sorted by balance in descending order.
---select*
   from accounts
   order by balance desc;

17. List customers sorted alphabetically by name.
---select*
   from customers
   order by name;

18. Display accounts sorted by account type and then by balance (descending).
---select*
   from accounts
   order by account_type , balance desc;
 


Aggregate Functions (19–23)

19. Find the total balance of all accounts.
---select sum(balance)
   from accounts;

20. Calculate the average balance of accounts.
---select avg(balance)
   from accounts;
 
21. Find the maximum account balance.
---select max(balance)
   from accounts;

22. Find the minimum account balance.
---select min(balance)
   from accounts;

23. Count the total number of customers.
---select count(*)
   from customers;



GROUP BY + HAVING (24–28)

24. Find total balance grouped by account type.
---select account_type, sum(balance)
   from accounts
   group by account_type;

25. Find average balance for each account type.
---SELECT account_type, avg(balance)
   FROM accounts
   GROUP BY account_type;

26. Display account types having average balance greater than 20,000.
---select account_type, avg(balance)
   from accounts
   GROUP BY account_type
   having avg(balance)>20000
 
27. Count number of accounts for each customer.
---SELECT customer_id,	 COUNT(*)
   FROM accounts
   GROUP BY customer_id;

28. Display customers having more than one account.
---SELECT customer_id, COUNT(*)
   FROM accounts
   GROUP BY customer_id
   HAVING COUNT(*) > 1;



JOINS (29–35)

29. Retrieve customer names along with their account balances.
---SELECT c.name, a.balance
   FROM customers c
   INNER JOIN accounts a
   ON c.customer_id = a.customer_id;

30. Display all customers and their accounts (including customers without accounts).
---SELECT c.name, a.account_id, a.account_type, a.balance
   FROM customers c
   LEFT JOIN accounts a
   ON c.customer_id = a.customer_id;

31. Display all accounts and corresponding customer details.
---SELECT a.account_id, a.account_type, a.balance, c.name, c.city
   FROM accounts a
   LEFT JOIN customers c
   ON a.customer_id = c.customer_id;

32. Retrieve customer names and account types where balance is greater than 20,000.
---SELECT c.name, a.account_type, a.balance
    FROM customers c
    INNER JOIN accounts a
    ON c.customer_id = a.customer_id
    WHERE a.balance > 20000;

33. List customers with their total balance using JOIN.
---SELECT c.name, SUM(a.balance) AS total_balance
   FROM customers c
   INNER JOIN accounts a
   ON c.customer_id = a.customer_id
   GROUP BY c.customer_id, c.name;

34. Display customer names and balances sorted by balance.
---SELECT c.name, a.balance
    FROM customers c
    INNER JOIN accounts a
    ON c.customer_id = a.customer_id
    ORDER BY a.balance ASC;

35. Count number of accounts for each city using JOIN.
 ---SELECT c.city, COUNT(a.account_id) AS total_accounts
    FROM customers c
    LEFT JOIN accounts a
    ON c.customer_id = a.customer_id
    GROUP BY c.city;



SUBQUERIES (36–40)

36. Find accounts with balance greater than average balance.
--- SELECT *
    FROM accounts
    WHERE balance > (SELECT AVG(balance)
    FROM accounts);
 

37. Retrieve customers who have accounts.
---SELECT *
    FROM customers
    WHERE customer_id IN (SELECT customer_id
    FROM accounts);


38. Find customers who do not have any accounts.
---SELECT *
   FROM customers
   WHERE customer_id NOT IN (
     SELECT customer_id
     FROM accounts
     WHERE customer_id IS NOT NULL);


39. Display account(s) with the maximum balance.
 ---SELECT *
    FROM accounts
    WHERE balance = (
     SELECT MAX(balance)
     FROM accounts);

40. Find customers whose total balance is greater than 40,000.
---SELECT *
   FROM customers c
   WHERE (
     SELECT SUM(a.balance)
     FROM accounts a
     WHERE a.customer_id = c.customer_id) > 40000;



RAILWAY RESERVATION – QUESTIONS

Basic + WHERE + Operators (41–45)

41. Retrieve all bookings with fare greater than 400.
---SELECT *
   FROM bookings
   WHERE fare > 400;


42. Find bookings where status is not 'Confirmed'.
 ---SELECT *
    FROM bookings
    WHERE status != 'Confirmed';

43. Display trains starting from Chennai.
 ---SELECT *
    FROM trains
    WHERE source = 'Chennai';

44. Retrieve bookings with fare between 300 and 500.
---SELECT *
   FROM bookings
   WHERE fare BETWEEN 300 AND 500;

45. Find passengers whose names start with 'A'.
---SELECT *
   FROM Trains
   WHERE train_name LIKE 'A%';



JOINS + GROUP BY + ORDER BY (46–48)

46. Retrieve train names along with passenger names.
---SELECT trains.train_name, passengers.passenger_name
   FROM trains
   INNER JOIN passengers
   ON trains.train_id = passengers.train_id;

47. Count number of bookings for each train.
---SELECT t.train_name, COUNT(b.booking_id) AS total_bookings
   FROM trains t
   JOIN bookings b ON t.train_id = b.train_id
   GROUP BY t.train_name
   ORDER BY total_bookings DESC;

48. Display train names and total fare collected for each train.
---SELECT t.train_name, SUM(b.fare) AS total_fare
   FROM trains t
   JOIN bookings b ON t.train_id = b.train_id
   GROUP BY t.train_name
   ORDER BY total_fare DESC;



SUBQUERIES (49–50)

49. Find bookings with fare equal to the highest fare.
---SELECT *
   FROM bookings
   WHERE fare = (SELECT MAX(fare)
   FROM bookings);

50. Retrieve trains that have more than one booking.
---SELECT *
   FROM trains
   WHERE train_id IN (
   SELECT train_id
   FROM bookings
   GROUP BY train_id
   HAVING COUNT(booking_id) > 1);