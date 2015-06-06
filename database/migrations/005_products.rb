require 'sinatra'
require 'sinatra/sequel'

Sequel.migration do
  up do
    self[:products].insert(
      :ean_code => '7896079500151',
      :name => 'LEITE LV INTEGRAL ELEGE',
      :created_at => Time.now
    )
    self[:products].insert(
        :ean_code => '7891150006058',
        :name => 'SAB DOVE MEN CLEAN CONFORT',
        :created_at => Time.now
    )
    self[:products].insert(
        :ean_code => '7896074600993',
        :name => 'PAO QUEIJO TRAD F.MINAS 400G',
        :created_at => Time.now
    )
    self[:products].insert(
        :ean_code => '2453390000002',
        :name => 'LASANHA MISTA CARNE ZAF',
        :created_at => Time.now
    )
    self[:products].insert(
        :ean_code => '2064770000002',
        :name => 'BIFE A PARMEGGIANA ZAF',
        :created_at => Time.now
    )
    self[:products].insert(
        :ean_code => '2073200000000',
        :name => 'ARROZ BRANCO COZIDO ZAF',
        :created_at => Time.now
    )
    self[:products].insert(
        :ean_code => '2072070000004',
        :name => 'FEIJAO PRETO ZAF',
        :created_at => Time.now
    )
    self[:products].insert(
        :ean_code => '7891022854787',
        :name => 'DESINF PINHO BRIL B MAR L500P450',
        :created_at => Time.now
    )
    self[:products].insert(
        :ean_code => '7894650002667',
        :name => 'GEL ADESIVO PATO MARINE RF 38G',
        :created_at => Time.now
    )
    self[:products].insert(
        :ean_code => '7898909332116',
        :name => 'USE IT HASTES FLEXIVEIS 75UN',
        :created_at => Time.now
    )
  end

  down do

  end
end
