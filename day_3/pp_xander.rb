module HourlyPay
	def calculate_salarym p_hour, h_worked
		p_hour*h_worked
	end

end

module SalariedPay
	def salary_pay salary_a
		salary_a/52
	end
end



class Employee
    attr_reader :name, :email
    def initialize(name, email)
      @name = name
      @email = email
    end
end

class HourlyEmployee < Employee
	include HourlyPay
	attr_reader :p_hour, :h_worked
    def initialize name, email, p_hour, h_worked
    	super(name,email)
        @p_hour= p_hour
        @h_worked= h_worked
        @week_salary=0
	end
	def calculate_salary
		@week_salary=calculate_salarym @p_hour, @h_worked
	end
end

class SalariedEmployee < Employee
	include SalariedPay
	attr_reader :salary_a
	def initialize name, email, salary_a
		super name, email
		@salary_a= salary_a
	end
	def calculate_salary
		salary_pay salary_a
	end

end

class MultiPaymentEmployee < Employee
	attr_reader :salary_a, :p_hour, :h_worked
	include SalariedPay
	include HourlyPay
	def initialize name, email, salary_a, p_hour, h_worked
		super name,email
		@salary_a=salary_a
		@p_hour=p_hour
		@h_worked=h_worked
	end

	def calculate_salary
		## REVISARRRRRR:::!!!!
	# 	extra=0
	# 	if @h_worked>40
	# 		extra=@p_hour*(@h_worked-40)
	# 	end
	# 	 (@salary_a/52)+extra
	# end
end

class Payroll
	def initialize employee
		@employee=employee
	end
	def pay_employees
		pago_total=0
		@employee.each do |em|
			puts "#{em.name} cobrará $#{em.calculate_salary}"
			pago_total+=em.calculate_salary
		end
		puts"el gasto semanal es de $#{pago_total}" 

	end

	def notify_employee employee
		puts"Se ha enviado un correo a #{employee.name} a la direccion #{employee.email}"

	end
			
end





josh = HourlyEmployee.new('Josh', 'nachoemail@example.com', 35, 50)
nizar = SalariedEmployee.new('Nizar', 'starcraftrulez@gmail.com', 1000000)
ted = MultiPaymentEmployee.new('Ted', 'fortranr0x@gmail.com', 60000, 275, 55)
giancarlo=HourlyEmployee.new('Giancarlo', 'nachoemail@example.com', 15, 50)
xander=HourlyEmployee.new('Xander', 'nachoemail__@example.com', 15, 70)

employees = [josh, nizar, ted, giancarlo, xander]

payroll = Payroll.new(employees)

payroll.pay_employees
payroll.notify_employee(josh)


