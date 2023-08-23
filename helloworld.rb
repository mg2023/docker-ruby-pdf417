require 'sinatra'
require 'pdf-417'

set :port, 3333
set :bind, '0.0.0.0'

get '/' do
    'Hello World!'
end

PDF417.to_png("sample.png", "This is my PDF417 barcode!")

