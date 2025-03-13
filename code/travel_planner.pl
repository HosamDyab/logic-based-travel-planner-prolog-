% Facts
% city(Name)
city(cairo).
city(as3wan).
city(portsaid).
city(luxor).

% attraction(City, Attraction)
attraction(cairo, pyramids).
attraction(cairo, museums).
attraction(aswan, temple).
attraction(portsaid, port_fouad).
attraction(luxor, valley_of_kings).

% hotel(City, Name, PricePerNight, Rating)
hotel(cairo, 'four_seasons', 2000, 4.8).
hotel(cairo, 'hilton', 1500, 4.2).
hotel(aswan, 'sofitel', 1800, 4.5).
hotel(portsaid, 'grand_hotel', 1200, 4.0).
hotel(luxor, 'maritim', 1600, 4.3).

% transport(City, Mode, Cost)
transport(cairo, car, 500).
transport(cairo, train, 300).
transport(aswan, plane, 1000).
transport(portsaid, ferry, 200).
transport(luxor, bus, 400).

% activity(City, Activity, Cost)
activity(cairo, shopping, 300).
activity(cairo, cinema, 200).
activity(aswan, boat_ride, 400).
activity(portsaid, beach, 150).
activity(luxor, tour, 500).

% Rules
% estimated_budget(City, Days, Budget)
estimated_budget(City, Days, Budget) :-
    hotel(City, _, PricePerNight, _),
    transport(City, _, TransportCost),
    FoodCost is Days * 300, % Daily food estimate
    TotalHotelCost is PricePerNight * Days,
    Budget is TotalHotelCost + TransportCost + FoodCost.

% recommend_hotel(City, Hotel, Budget, Days)
recommend_hotel(City, Hotel, Budget, Days) :-
    hotel(City, Hotel, PricePerNight, _),
    TotalCost is PricePerNight * Days,
    TotalCost =< Budget.

% top_rated_hotel(City, Hotel)
top_rated_hotel(City, Hotel) :-
    hotel(City, Hotel, _, Rating),
    Rating >= 4.2.

% personalized_recommendation(City, Hotel, Activity, Budget, Days)
personalized_recommendation(City, Hotel, Activity, Budget, Days) :-
    hotel(City, Hotel, PricePerNight, _),
    activity(City, Activity, ActCost),
    TotalCost is (PricePerNight * Days) + ActCost,
    TotalCost =< Budget.
