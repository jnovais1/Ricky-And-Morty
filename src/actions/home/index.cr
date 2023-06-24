class Home::Index < ApiAction
  get "/" do
    json({hello: "Multiverse Travel Booker - Milenio Capital - Code Challenge"})
  end
end
