DELIMITER $$
CREATE PROCEDURE sp_obtener_suscripciones ()
  BEGIN

    SELECT * FROM suscripciones;

  END $$
DELIMITER ;