insert into customers
(customer_id, first_name, last_name, gender, "DOB", job_title, job_industry_category, wealth_segment, deceased_indicator, owns_car, address, postcode, state, country, property_valuation)
values
    (2950, 'Kristos', 'Anthony', 'Male', '1955-01-11', 'Software Engineer I', 'Financial Services', 'Mass Customer', false, true, '3 New Castle Terrace', 3032, 'VIC', 'Australia', 8),
    (3120, 'Lauree', 'O''Donnell', 'Female', '1979-02-04', 'Clinical Specialist', 'Health', 'Mass Customer', false, true, '32 Elmside Point', 2560, 'NSW', 'Australia', 6),
    (402, 'Berne', 'Donegan', 'Male', '1977-06-03', 'Desktop Support Technician', 'Retail', 'Affluent Customer', false, false, '07 New Castle Circle', 2646, 'NSW', 'Australia', 1);

insert into items
(item_id, brand, product_line, product_class, product_size)
values
    (1, 'Solex', 'Standard', 'medium', 'medium'),
    (2, 'Trek Bicycles', 'Standard', 'medium', 'large'),
    (3, 'OHM Cycles', 'Standard', 'low', 'medium');

insert into offers
(offer_id, item_id, product_id, standard_cost, transaction_date)
values
    (1, 1, 2, 53.62, '2017-02-25'),
    (2, 2, 3, 388.92, '2017-05-21'),
    (3, 3, 37, 248.82, '2017-10-16');

insert into transactions
(transaction_id, customer_id, offer_id, online_order, order_status, list_price)
values
    (1, 2950, 1, false, 'Approved', 71.49),
    (2, 3120, 2, true, 'Approved', 2091.47),
    (3, 402, 3, false, 'Approved', 1793.43);
