# Implementar en este fichero las Pruebas Unitarias asociadas a la clase Fraccion

require "./racional.rb"
require "test/unit"

class Test_Fraccion < Test::Unit::TestCase

 def setup
    @x = Fraccion.new(2, 4)
    @y = Fraccion.new(10, 20)
  end

  def test_parametros #Comprobacion de excepciones

    assert_raise( ArgumentError ) do
        Fraccion.new('a', 'b')
    end

    assert_raise( ArgumentError ) do
        Fraccion.new(2, 0)
    end

  end
  
  def test_minimizar
    f = Fraccion.new(2, 8)
    assert_equal(1, f.num_)
    assert_equal(4, f.den_)
    f = Fraccion.new(2*3*5, 2*2*5)
    assert_equal(3, f.num_)
    assert_equal(2, f.den_)
  end

  def test_gcd
    f = gcd(2*3*7, 3*3*7)
    assert_equal(3*7, f)
    f = gcd(0, 0)
    assert_equal(1, f)
  end
 
  def test_suma
    @x+@y
    assert @x.num_ == 1 and @x.den_ == 1
  end

  def test_resta
    @x-@y
    assert @x.num_ == 0 and @x.den_ == 1
  end
  
  def test_producto
    @x*@y
    assert @x.num_ == 1 and @x.den_ == 4
  end

  def test_division
    @x/@y
    assert @x.num_ == 1 and @x.den_ == 1
  end

end
