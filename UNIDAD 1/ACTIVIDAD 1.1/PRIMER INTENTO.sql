DECLARE 
v_countryid     locations.country_id%TYPE := 'CA';
v_loc_id        locations.location_id%TYPE;
v_contador      NUMBER(2) :=1;
v_new_city      locations.city%TYPE :='Montreal';

BEGIN
    SELECT MAX(location_id)
        INTO v_loc_id
    FROM locations
    WHERE country_idb = v_countryid;
    LOOP
        INSERT INTO locations(location_id, city, country_id)
        VALUES((v_loc_id + v_contador), v_new_city, v_countryid);
        v_contador := v_contador +1;
    EXIT WHEN v_contador > 3;
    END LOOP;
END;     