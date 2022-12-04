select bg.model_name, b.brand_name , a.car_group_name , v.dt_purchase, v.plate, c.color_name, v.km_tot, i.company_name, ip.policy_number 
from practicamf.brand_group bg, practicamf.vehicles v, practicamf.brands b, practicamf.association a, practicamf.colors c, practicamf.insurances i, practicamf.insurance_policy ip  
where v.id_car = bg.id_car and bg.id_brand = b.id_brand and bg.id_group = a.id_group and c.id_color = v.id_color and ip.id_car = v.id_car and i.id_insurance = ip.id_insurance  ;

