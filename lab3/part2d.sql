CALL increase_salary_proc(45, 120, @error);
SELECT @error;
CALL increase_salary_proc(200,12,@error);
SELECT @error;
CALL increase_salary_proc(68,20,@error);
SELECT @error;