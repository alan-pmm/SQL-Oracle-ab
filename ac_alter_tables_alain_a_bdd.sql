

ALTER  TABLE ALAIN.a_order_history
ADD 
(
CONSTRAINT fk_product_id foreign key(PRODUCT_ID) REFERENCES ALAIN.A_PRODUCT(PRODUCT_ID)ENABLE,
CONSTRAINT fk_person_id foreign key(PERSON_ID) references ALAIN.A_PERSON(PERSON_ID)ENABLE
);
