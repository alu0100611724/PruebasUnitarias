# Implementar en este fichero la clase para crear objetos racionales

require "./gcd.rb"

class Fraccion

    attr_accessor :num_ #numerador
    attr_accessor :den_ #denominador

    include Comparable
    include Enumerable

    def initialize(num, den)
        #Comprobacion de datos introducidos
        raise ArgumentError, 'El denominador no puede ser cero' unless den != 0
        raise ArgumentError, 'El denominador no es numerico' unless den.is_a? Numeric
        raise ArgumentError, 'El numerador no es numerico' unless num.is_a? Numeric
        
        minimizar num, den
    end
    
    def minimizar(num, den)
        mcd = gcd num, den
        @num_ = num / mcd
        @den_ = den / mcd
    end
    
    def mcm(n1, n2)
       mcd = gcd(n1, n2)   
       return (n1 * n2) / mcd
    end

    def to_s
        if (@den_ != 1)
            return "(#@num_ / #@den_)"
        else
            return "#@num_"
        end
    end
    
    def +(other)
        num = (@num_ * other.den_) + (other.num_ * @den_)
        den = (@den_ * other.den_)
        resultado = minimizar(num, den)
    end
    
    def -(other)
        num = (@num_ * other.den_) - (other.num_ * @den_)
        den = (@den_ * other.den_)
        resultado = minimizar(num, den)
    end
    
    def *(other)
        num = (@num_ * other.num_)
        den = (@den_ * other.den_)
        resultado = minimizar(num, den)
    end

    def /(other)
        num = (@num_ * other.den_)
        den = (@den_ * other.num_)
        resultado = minimizar(num, den)
    end

    def eql?(o)
        return @num_.eql?(o.num_) && @den_.eql?(o.den_) if o.instance_of? Fraccion
        false
    end

    def ==(o)
        return @num_ == o.num_ && @den_ == o.den_ if o.instance_of? Fraccion
	false
    end

    def <=>(o)
        return nil unless o.instance_of? Fraccion
        @den_*@den_+@num_*@num_ <=> o.den_*o.den_+o.num_*o.num_
    end
end
