/*Trigger to Update Stock quantity after order is placed*/

CREATE TRIGGER `QuantityUpdate` AFTER INSERT ON `orderdetail`
 FOR EACH ROW UPDATE product
SET product.quantityOnHand = Product.quantityOnHand - New.quantityOrdered 
WHERE product.productNo = New.productNo

/*Trigger to check order quantity against stock balance*/
DELIMITER $$
CREATE TRIGGER check_quantity_on_order 
BEFORE INSERT ON orderdetail 
FOR EACH ROW 
BEGIN 
    DECLARE quantity_on_hand INT; 
    SELECT quantityOnHand INTO quantity_on_hand 
    FROM product 
    WHERE productNo = NEW.productNo; 

    IF NEW.quantityOrdered > quantity_on_hand THEN 
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Order quantity exceeds the quantity on hand'; 
    END IF; 
END$$
DELIMITER ;
