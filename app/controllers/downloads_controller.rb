class DownloadsController < ApplicationController
  def exe
    send_file Rails.root.join('public/downloads', 'Programma_proverki_kachestva_chipov (www.mosflash.ru).exe'), :type=>"application/exe", :x_sendfile=>true
  end
end
