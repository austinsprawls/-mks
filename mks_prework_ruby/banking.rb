class Person

    attr_reader :name
    attr_accessor :cash
    attr_accessor :accounts

    def initialize(name, cash)
        @name = name
        @cash = cash
        @accounts = {}
        puts "Hi, #{@name}. You have $#{cash}!"
    end
end

class Bank

    attr_accessor :institution
    attr_accessor :total_cash
    attr_reader :check_accounts

    def initialize(institution)
        @institution = institution
        @total_cash = 0
        @check_accounts = {}
        puts "#{@institution} bank was just created"
    end

    def open_account(person)
        person.accounts[@institution] = 0
        @check_accounts[person.name] = 0
        puts "#{person.name}, thanks for opening an account at #{@institution}!"
    end

    def withdraw(person, amount)
        if amount <= person.accounts[@institution]
            person.accounts[@institution] -= amount
            person.cash += amount
            @check_accounts[person.name] -= amount
            puts "#{person.name} withdrew $#{amount} from #{@institution}. #{person.name} has $#{person.cash} in cash. #{person.name}'s account has $#{person.accounts[@institution]}"
        else
            puts "#{person.name} does not have enough money in the account to withdraw $#{amount}"
        end
        @total_cash -= amount
    end

    def deposit(person, amount)
        if amount <= person.cash
            person.accounts[@institution] += amount
            person.cash -= amount
            @check_accounts[person.name] += amount
            puts "#{person.name} deposited $#{amount} to #{@institution}. #{person.name} has $#{person.cash} in cash. #{person.name}'s account has $#{person.accounts[@institution]}"
        else
            puts "#{person.name} does not have enough cash to deposit $#{amount}."
        end
        @total_cash += amount
    end

    def transfer(person, new_bank, amount)
        person.accounts[@institution] -= amount
        person.accounts[new_bank.institution] += amount
        @total_cash -= amount
        new_bank.total_cash += amount
        @check_accounts[person.name] -= amount
        new_bank.check_accounts[person.name] += amount
        puts "#{person.name} transferred $#{amount} from the #{@institution} account to the #{new_bank.institution} account.
        The #{@institution} account has $#{person.accounts[@institution]} and the #{new_bank.institution} account has $#{person.accounts[new_bank.institution]}. "
    end

    def total_cash_in_bank
        puts "#{@institution} has $#{@total_cash} in the bank."
    end

end

chase = Bank.new("JP Morgan Chase")
wells_fargo = Bank.new("Wells Fargo")
friend1 = Person.new("John", 1000)
me = Person.new("Shehzan", 500)


chase.open_account(me)
chase.open_account(friend1)
wells_fargo.open_account(me)
wells_fargo.open_account(friend1)

chase.deposit(me, 200)
chase.deposit(friend1, 300)
chase.withdraw(me, 50)

chase.transfer(me, wells_fargo, 100)

chase.deposit(me, 5000)
chase.withdraw(me, 5000)

puts chase.total_cash_in_bank
puts wells_fargo.total_cash_in_bank
puts chase.check_accounts
