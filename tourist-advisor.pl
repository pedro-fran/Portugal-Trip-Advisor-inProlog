:- use_module(library(lists)).
:- discontiguous handle_choice/1.
:- discontiguous avoid_if/2.
:- dynamic crowd_level/3.

%  destination(Name, Region, Tags)

destination(lisboa,           center, [urban, historic, nightlife, culture, food, museums, fado, family, coast]).
destination(porto,            north,  [urban, historic, wine, food, culture, bridges, fado, nightlife]).
destination(braga,            north,  [historic, religious, youth, culture, architecture, monuments]).
destination(guimaraes,        north,  [historic, medieval, culture, birthplace, castle, small]).
destination(douro,            north,  [wine, nature, scenic, rural, romantic, cruise, quinta]).
destination(viana,            north,  [folklore, beach, traditional, festivals, authentic]).
destination(aveiro,           center, [urban, canals, coastal, romantic, food, boats]).
destination(coimbra,          center, [historic, university, fado, culture, youth, rivers]).
destination(sintra,           center, [historic, nature, palaces, day_trip, romantic, unesco]).
destination(cascais,          center, [beach, coast, upscale, family, day_trip, sunny]).
destination(obidos,           center, [historic, medieval, romantic, day_trip, small]).
destination(nazare,           center, [beach, surf, coastal, traditional, family, waves]).
destination(setubal,          center, [nature, dolphins, beaches, parks, outdoor]).
destination(serra_da_estrela, center, [nature, mountain, snow, hiking, cheese, cold, scenic]).
destination(alentejo,         south,  [rural, wine, cork, plains, gastronomy, slow_travel, hot]).
destination(evora,            south,  [historic, roman, unesco, alentejo, gastronomy, small]).
destination(faro,             south,  [historic, coastal, nature, gateway, summer, warm]).
destination(albufeira,        south,  [beach, resort, nightlife, family, summer, warm]).
destination(lagos,            south,  [beach, cliffs, surf, nightlife, scenic, summer]).
destination(madeira,          island, [nature, hiking, flowers, mild, scenic, island, levadas]).
destination(acores,           island, [nature, hiking, volcanic, island, whale_watching, remote, green]).

%  COSTS (Numbeo data, EUR/day per person)
%  cost(Destination, Style, AccomPerNight, MealPerPerson, TransportPerDay)

cost(lisboa,           budget,  40, 10,  2).
cost(lisboa,           mid,     90, 20,  5).
cost(lisboa,           luxury, 200, 50, 15).

cost(porto,            budget,  35,  9,  2).
cost(porto,            mid,     80, 18,  4).
cost(porto,            luxury, 170, 45, 12).

cost(braga,            budget,  30,  8,  2).
cost(braga,            mid,     60, 15,  3).
cost(braga,            luxury, 130, 35,  8).

cost(guimaraes,        budget,  30,  8,  2).
cost(guimaraes,        mid,     65, 16,  4).
cost(guimaraes,        luxury, 140, 38, 10).

cost(douro,            budget,  45, 10,  8).
cost(douro,            mid,     95, 22, 12).
cost(douro,            luxury, 220, 50, 20).

cost(viana,            budget,  30,  8,  3).
cost(viana,            mid,     65, 15,  5).
cost(viana,            luxury, 140, 35, 10).

cost(aveiro,           budget,  35,  9,  3).
cost(aveiro,           mid,     75, 18,  5).
cost(aveiro,           luxury, 150, 40, 10).

cost(coimbra,          budget,  30,  8,  2).
cost(coimbra,          mid,     65, 15,  3).
cost(coimbra,          luxury, 140, 35,  8).

cost(sintra,           budget,  60, 12,  3).
cost(sintra,           mid,    120, 25,  5).
cost(sintra,           luxury, 280, 60, 10).

cost(cascais,          budget,  55, 12,  3).
cost(cascais,          mid,    110, 22,  5).
cost(cascais,          luxury, 230, 50, 10).

cost(obidos,           budget,  55, 11,  4).
cost(obidos,           mid,    100, 20,  6).
cost(obidos,           luxury, 200, 45, 10).

cost(nazare,           budget,  35, 10,  2).
cost(nazare,           mid,     80, 20,  5).
cost(nazare,           luxury, 160, 45, 12).

cost(setubal,          budget,  35,  9,  5).
cost(setubal,          mid,     70, 17,  7).
cost(setubal,          luxury, 150, 38, 12).

cost(serra_da_estrela, budget,  40, 12,  5).
cost(serra_da_estrela, mid,     90, 25,  8).
cost(serra_da_estrela, luxury, 200, 50, 15).

cost(alentejo,         budget,  30,  9,  6).
cost(alentejo,         mid,     70, 18, 10).
cost(alentejo,         luxury, 160, 40, 15).

cost(evora,            budget,  35,  9,  4).
cost(evora,            mid,     75, 18,  6).
cost(evora,            luxury, 160, 40, 12).

cost(faro,             budget,  40, 10,  3).
cost(faro,             mid,     85, 20,  5).
cost(faro,             luxury, 180, 45, 12).

cost(albufeira,        budget,  45, 12,  5).
cost(albufeira,        mid,    110, 22,  8).
cost(albufeira,        luxury, 240, 55, 18).

cost(lagos,            budget,  45, 11,  4).
cost(lagos,            mid,    100, 22,  6).
cost(lagos,            luxury, 220, 50, 15).

cost(madeira,          budget,  40, 11,  3).
cost(madeira,          mid,     85, 22,  5).
cost(madeira,          luxury, 190, 50, 10).

cost(acores,           budget,  35, 10,  5).
cost(acores,           mid,     75, 20,  8).
cost(acores,           luxury, 170, 45, 15).

%  weather(Destination, Month, Condition, AvgTempC)

weather(lisboa, jan, mild,  12). weather(lisboa, feb, mild,  13).
weather(lisboa, mar, mild,  15). weather(lisboa, apr, warm,  17).
weather(lisboa, may, warm,  19). weather(lisboa, jun, sunny, 23).
weather(lisboa, jul, sunny, 27). weather(lisboa, aug, sunny, 28).
weather(lisboa, sep, sunny, 25). weather(lisboa, oct, warm,  21).
weather(lisboa, nov, rainy, 16). weather(lisboa, dec, rainy, 13).

weather(porto,  jan, rainy, 10). weather(porto,  feb, rainy, 11).
weather(porto,  mar, mild,  13). weather(porto,  apr, mild,  15).
weather(porto,  may, warm,  18). weather(porto,  jun, warm,  21).
weather(porto,  jul, sunny, 24). weather(porto,  aug, sunny, 24).
weather(porto,  sep, warm,  22). weather(porto,  oct, rainy, 18).
weather(porto,  nov, rainy, 13). weather(porto,  dec, rainy, 11).

weather(faro,   jan, mild,  15). weather(faro,   feb, mild,  16).
weather(faro,   mar, warm,  18). weather(faro,   apr, sunny, 20).
weather(faro,   may, sunny, 23). weather(faro,   jun, sunny, 27).
weather(faro,   jul, hot,   30). weather(faro,   aug, hot,   31).
weather(faro,   sep, sunny, 27). weather(faro,   oct, sunny, 23).
weather(faro,   nov, mild,  18). weather(faro,   dec, mild,  15).

weather(madeira,jan, mild,  17). weather(madeira,feb, mild,  17).
weather(madeira,mar, warm,  18). weather(madeira,apr, warm,  19).
weather(madeira,may, warm,  21). weather(madeira,jun, warm,  23).
weather(madeira,jul, sunny, 25). weather(madeira,aug, sunny, 26).
weather(madeira,sep, warm,  25). weather(madeira,oct, mild,  23).
weather(madeira,nov, mild,  20). weather(madeira,dec, mild,  18).

weather(acores, jan, rainy, 15). weather(acores, feb, rainy, 14).
weather(acores, mar, mild,  15). weather(acores, apr, mild,  16).
weather(acores, may, warm,  18). weather(acores, jun, warm,  21).
weather(acores, jul, sunny, 23). weather(acores, aug, sunny, 24).
weather(acores, sep, warm,  23). weather(acores, oct, mild,  21).
weather(acores, nov, rainy, 18). weather(acores, dec, rainy, 16).

weather(braga,            M, C, T) :- weather(porto,  M, C, T0), T is T0 + 1.
weather(guimaraes,        M, C, T) :- weather(porto,  M, C, T).
weather(viana,            M, C, T) :- weather(porto,  M, C, T).
weather(douro,            M, C, T) :- weather(porto,  M, C, T0), T is T0 + 2.
weather(aveiro,           M, C, T) :- weather(porto,  M, C, T0), T is T0 + 1.
weather(coimbra,          M, C, T) :- weather(lisboa, M, C, T0), T is T0 - 1.
weather(nazare,           M, C, T) :- weather(lisboa, M, C, T0), T is T0 - 1.
weather(sintra,           M, C, T) :- weather(lisboa, M, C, T).
weather(cascais,          M, C, T) :- weather(lisboa, M, C, T).
weather(obidos,           M, C, T) :- weather(lisboa, M, C, T).
weather(setubal,          M, C, T) :- weather(lisboa, M, C, T).
weather(evora,            M, C, T) :- weather(lisboa, M, C, T0), T is T0 + 2.
weather(alentejo,         M, C, T) :- weather(evora,  M, C, T).
weather(serra_da_estrela, M, C, T) :- weather(lisboa, M, C, T0), T is T0 - 8.
weather(albufeira,        M, C, T) :- weather(faro,   M, C, T).
weather(lagos,            M, C, T) :- weather(faro,   M, C, T0), T is T0 - 1.

%  crowd_level(Dest, Month, Level)   Level: low / medium / high / extreme

    crowd_level(lisboa,    jan, low).
    crowd_level(lisboa,    feb, low).
    crowd_level(lisboa,    mar, medium).
    crowd_level(lisboa,    apr, medium).
    crowd_level(lisboa,    may, medium).
    crowd_level(lisboa,    jun, high).
    crowd_level(lisboa,    jul, extreme).
    crowd_level(lisboa,    aug, extreme).
    crowd_level(lisboa,    sep, high).
    crowd_level(lisboa,    oct, medium).
    crowd_level(lisboa,    nov, low).
    crowd_level(lisboa,    dec, medium).

    crowd_level(porto,     jan, low).
    crowd_level(porto,     feb, low).
    crowd_level(porto,     mar, low).
    crowd_level(porto,     apr, medium).
    crowd_level(porto,     may, medium).
    crowd_level(porto,     jun, high).
    crowd_level(porto,     jul, high).
    crowd_level(porto,     aug, extreme).
    crowd_level(porto,     sep, high).
    crowd_level(porto,     oct, medium).
    crowd_level(porto,     nov, low).
    crowd_level(porto,     dec, medium).

    crowd_level(sintra,    jan, low).
    crowd_level(sintra,    feb, low).
    crowd_level(sintra,    mar, medium).
    crowd_level(sintra,    apr, high).
    crowd_level(sintra,    may, high).
    crowd_level(sintra,    jun, extreme).
    crowd_level(sintra,    jul, extreme).
    crowd_level(sintra,    aug, extreme).
    crowd_level(sintra,    sep, high).
    crowd_level(sintra,    oct, medium).
    crowd_level(sintra,    nov, low).
    crowd_level(sintra,    dec, low).

    crowd_level(albufeira, jan, low).
    crowd_level(albufeira, feb, low).
    crowd_level(albufeira, mar, low).
    crowd_level(albufeira, apr, medium).
    crowd_level(albufeira, may, medium).
    crowd_level(albufeira, jun, high).
    crowd_level(albufeira, jul, extreme).
    crowd_level(albufeira, aug, extreme).
    crowd_level(albufeira, sep, high).
    crowd_level(albufeira, oct, medium).
    crowd_level(albufeira, nov, low).
    crowd_level(albufeira, dec, low).

    crowd_level(lagos,     jan, low).
    crowd_level(lagos,     feb, low).
    crowd_level(lagos,     mar, low).
    crowd_level(lagos,     apr, medium).
    crowd_level(lagos,     may, medium).
    crowd_level(lagos,     jun, high).
    crowd_level(lagos,     jul, extreme).
    crowd_level(lagos,     aug, extreme).
    crowd_level(lagos,     sep, high).
    crowd_level(lagos,     oct, medium).
    crowd_level(lagos,     nov, low).
    crowd_level(lagos,     dec, low).

    crowd_level(faro,      jan, low).
    crowd_level(faro,      feb, low).
    crowd_level(faro,      mar, low).
    crowd_level(faro,      apr, medium).
    crowd_level(faro,      may, medium).
    crowd_level(faro,      jun, high).
    crowd_level(faro,      jul, extreme).
    crowd_level(faro,      aug, extreme).
    crowd_level(faro,      sep, high).
    crowd_level(faro,      oct, medium).
    crowd_level(faro,      nov, low).
    crowd_level(faro,      dec, low).

    crowd_level(evora,     jan, low).
    crowd_level(evora,     feb, low).
    crowd_level(evora,     mar, low).
    crowd_level(evora,     apr, medium).
    crowd_level(evora,     may, medium).
    crowd_level(evora,     jun, medium).
    crowd_level(evora,     jul, high).
    crowd_level(evora,     aug, high).
    crowd_level(evora,     sep, medium).
    crowd_level(evora,     oct, low).
    crowd_level(evora,     nov, low).
    crowd_level(evora,     dec, low).

    crowd_level(madeira,   jan, medium).
    crowd_level(madeira,   feb, high).
    crowd_level(madeira,   mar, medium).
    crowd_level(madeira,   apr, high).
    crowd_level(madeira,   may, medium).
    crowd_level(madeira,   jun, medium).
    crowd_level(madeira,   jul, high).
    crowd_level(madeira,   aug, high).
    crowd_level(madeira,   sep, medium).
    crowd_level(madeira,   oct, medium).
    crowd_level(madeira,   nov, low).
    crowd_level(madeira,   dec, high).

% Default crowd for destinations not explicitly listed
crowd_level(Dest, Month, medium) :-
    destination(Dest, _, _),
    month(Month),
    \+ clause(crowd_level(Dest, Month, _), _).

%  event(Dest, Name, Month, Type)
%  Types: festival, music, religious, gastronomy, sport, market, cultural

event(lisboa,    'Festas de Lisboa (Santos Populares)',      jun, festival).
event(lisboa,    'NOS Alive Music Festival',                 jul, music).
event(lisboa,    'Rock in Rio Lisboa',                       jun, music).
event(lisboa,    'Carnival of Lisbon',                       feb, festival).
event(lisboa,    'DocLisboa Film Festival',                  oct, cultural).
event(lisboa,    'Christmas Market at Rossio',               dec, market).

event(porto,     'Sao Joao Festival',                        jun, festival).
event(porto,     'Primavera Sound Porto',                    jun, music).
event(porto,     'Fantasporto Film Festival',                feb, cultural).
event(porto,     'Porto Wine Fest',                          jun, gastronomy).
event(porto,     'Serralves em Festa',                       jun, cultural).

event(braga,     'Semana Santa (Holy Week)',                 apr, religious).
event(braga,     'Braga Romana',                             may, cultural).
event(braga,     'Braga Media Arts',                         apr, cultural).

event(guimaraes, 'Festas Gualterianas',                      aug, festival).
event(guimaraes, 'G Fest',                                   jul, music).

event(viana,     'Festa de Nossa Senhora da Agonia',         aug, festival).
event(viana,     'Viana Folk Festival',                      jul, cultural).

event(sintra,    'Sintra Music Festival',                    jun, music).
event(sintra,    'Halloween at Sintra Palaces',              oct, cultural).

event(obidos,    'Obidos Medieval Market',                   jul, market).
event(obidos,    'Obidos Chocolate Festival',                mar, gastronomy).
event(obidos,    'Obidos Christmas Village',                 dec, market).

event(nazare,    'Big Wave Season (surfing)',                 nov, sport).
event(nazare,    'Nazare Carnival',                          feb, festival).

event(coimbra,   'Queima das Fitas (student festival)',      may, festival).
event(coimbra,   'Coimbra Folk Festival',                    jul, cultural).

event(aveiro,    'Aveiro City Festival',                     may, festival).
event(aveiro,    'International Film Festival',              oct, cultural).

event(cascais,   'Portugal Open (tennis)',                   apr, sport).
event(cascais,   'Cascais Jazz Festival',                    oct, music).

event(alentejo,  'Ovibeja (livestock & gastronomy fair)',    apr, gastronomy).
event(alentejo,  'Alentejo Wine Harvest',                    sep, gastronomy).

event(evora,     'Evora Medieval Fair',                      jun, cultural).
event(evora,     'Festival Internacional de Musica',         jun, music).

event(albufeira, 'Algarve International Circuit races',      may, sport).
event(albufeira, 'Summer Beach Parties',                     jul, festival).

event(lagos,     'Lagos International Film Festival',        jul, cultural).
event(lagos,     'Southwest Alentejo Surf Festival',         oct, sport).

event(madeira,   'Madeira Carnival',                         feb, festival).
event(madeira,   'Madeira Flower Festival',                  may, festival).
event(madeira,   'Madeira Wine Festival',                    sep, gastronomy).
event(madeira,   'New Year Fireworks (world record)',        dec, festival).

event(acores,    'Whale Watching Season',                    apr, sport).
event(acores,    'Sanjoaninas Festival (Terceira)',          jun, festival).
event(acores,    'Azores Airlines Atlantic Airlines Open',   jun, sport).

event(douro,     'Douro Wine Harvest (Vindima)',             sep, gastronomy).
event(douro,     'Douro Valley Cruise Season',               apr, cultural).

event(faro,      'Noites de Faro',                           aug, festival).
event(faro,      'Faro International Motorbike Rally',       jul, cultural).

event(serra_da_estrela, 'Snow Season',                       jan, sport).
event(serra_da_estrela, 'Serra da Estrela Cheese Fair',      feb, gastronomy).

%  transport(From, To, Mode, DurationMins, AvgCostEUR)
%  Modes: train, bus, flight, ferry, car, metro

transport(lisboa,    porto,            train,  165, 25).
transport(lisboa,    porto,            bus,    210, 20).
transport(lisboa,    porto,            flight,  65, 60).
transport(lisboa,    faro,             train,  165, 22).
transport(lisboa,    faro,             bus,    195, 18).
transport(lisboa,    faro,             flight,  55, 50).
transport(lisboa,    sintra,           train,   40,  3).
transport(lisboa,    cascais,          train,   40,  3).
transport(lisboa,    setubal,          bus,     60,  4).
transport(lisboa,    evora,            bus,     90, 12).
transport(lisboa,    obidos,           bus,     70,  7).
transport(lisboa,    coimbra,          train,   65, 15).
transport(lisboa,    madeira,          flight,  90, 80).
transport(lisboa,    acores,           flight, 140, 90).
transport(porto,     braga,            train,   35,  4).
transport(porto,     guimaraes,        train,   70,  4).
transport(porto,     viana,            train,   75,  7).
transport(porto,     douro,            train,   90, 12).
transport(porto,     aveiro,           train,   45,  5).
transport(porto,     coimbra,          train,   65, 10).
transport(porto,     madeira,          flight, 100, 85).
transport(coimbra,   aveiro,           train,   40,  4).
transport(coimbra,   serra_da_estrela, bus,    120, 10).
transport(aveiro,    obidos,           bus,    120, 10).
transport(obidos,    nazare,           bus,     50,  5).
transport(faro,      albufeira,        bus,     60,  5).
transport(faro,      lagos,            bus,    100,  8).
transport(albufeira, lagos,            bus,     60,  5).
transport(evora,     alentejo,         bus,     90,  8).
transport(evora,     faro,             bus,    240, 18).
transport(madeira,   acores,           flight, 180, 110).

%  accommodation_type(Dest, Type, Description)

accommodation_type(douro,            quinta,       'Wine estate stays with vineyard views and tastings').
accommodation_type(alentejo,         agro_tourism, 'Working farm stays with local produce and cork forests').
accommodation_type(alentejo,         monte,        'Traditional Alentejo farmhouse (Monte) with pool').
accommodation_type(sintra,           palace_hotel, 'Converted palaces and manor houses in fairy-tale setting').
accommodation_type(obidos,           pousada,      'Historic pousada inside the medieval castle walls').
accommodation_type(evora,            convento,     'Converted convent with cloister courtyard').
accommodation_type(madeira,          quinta,       'Traditional quinta manor houses with tropical gardens').
accommodation_type(lagos,            surf_camp,    'Surf camps with board rental, lessons, and hostel vibe').
accommodation_type(viana,            guesthouse,   'Family-run guesthouses in traditional azulejo buildings').
accommodation_type(acores,           rural_house,  'Volcanic stone rural houses, some near calderas').
accommodation_type(braga,            boutique,     'Boutique hotels in restored historic city-centre buildings').
accommodation_type(guimaraes,        medieval_inn, 'Inns within the medieval town walls').
accommodation_type(cascais,          villa,        'Private villas with pools, popular for family bookings').
accommodation_type(nazare,           surf_hostel,  'Surf-oriented hostels near Praia do Norte for wave chasers').
accommodation_type(coimbra,          student_inn,  'Affordable inns catering to the university-town culture').
accommodation_type(aveiro,           canal_hotel,  'Boutique hotels overlooking the canals (Ria de Aveiro)').
accommodation_type(porto,            wine_hotel,   'Wine-themed hotels in the Ribeira and Gaia cellars district').
accommodation_type(lisboa,           design_hotel, 'Design-forward hotels in Chiado, Alfama and LX Factory area').
accommodation_type(faro,             boutique,     'Boutique stays in the Old Town near the lagoon').
accommodation_type(serra_da_estrela, mountain_lodge, 'Cosy lodges with fireplaces and mountain panoramas').

%  accessibility(Dest, Feature)
%  Features: wheelchair_friendly, english_widely_spoken, child_friendly,
%            senior_friendly, pet_friendly, vegetarian_options

accessibility(lisboa,    wheelchair_friendly).
accessibility(lisboa,    english_widely_spoken).
accessibility(lisboa,    child_friendly).
accessibility(lisboa,    vegetarian_options).
accessibility(porto,     english_widely_spoken).
accessibility(porto,     wheelchair_friendly).
accessibility(porto,     vegetarian_options).
accessibility(cascais,   child_friendly).
accessibility(cascais,   english_widely_spoken).
accessibility(cascais,   wheelchair_friendly).
accessibility(cascais,   pet_friendly).
accessibility(albufeira, child_friendly).
accessibility(albufeira, english_widely_spoken).
accessibility(albufeira, wheelchair_friendly).
accessibility(lagos,     english_widely_spoken).
accessibility(lagos,     pet_friendly).
accessibility(faro,      english_widely_spoken).
accessibility(faro,      wheelchair_friendly).
accessibility(sintra,    english_widely_spoken).
accessibility(madeira,   english_widely_spoken).
accessibility(madeira,   wheelchair_friendly).
accessibility(madeira,   child_friendly).
accessibility(madeira,   senior_friendly).
accessibility(evora,     english_widely_spoken).
accessibility(coimbra,   english_widely_spoken).
accessibility(aveiro,    wheelchair_friendly).
accessibility(aveiro,    child_friendly).
accessibility(braga,     english_widely_spoken).
accessibility(acores,    english_widely_spoken).
accessibility(acores,    pet_friendly).
accessibility(nazare,    child_friendly).
accessibility(nazare,    pet_friendly).
accessibility(douro,     senior_friendly).
accessibility(alentejo,  pet_friendly).
accessibility(alentejo,  senior_friendly).
accessibility(viana,     senior_friendly).
accessibility(obidos,    child_friendly).
accessibility(guimaraes, english_widely_spoken).

%  avoid_if(Dest, UserPreferenceTag)
%  If user wants Tag, they should avoid this destination

avoid_if(albufeira,  authentic).
avoid_if(albufeira,  quiet).
avoid_if(albufeira,  rural).
avoid_if(albufeira,  culture).
avoid_if(albufeira,  slow_travel).
avoid_if(lagos,      quiet).
avoid_if(lagos,      rural).
avoid_if(faro,       urban).
avoid_if(sintra,     quiet).         % very crowded in peak season
avoid_if(sintra,     authentic).
avoid_if(lisboa,     quiet).
avoid_if(lisboa,     rural).
avoid_if(porto,      quiet).
avoid_if(douro,      nightlife).
avoid_if(douro,      urban).
avoid_if(alentejo,   nightlife).
avoid_if(alentejo,   urban).
avoid_if(alentejo,   coast).
avoid_if(evora,      nightlife).
avoid_if(evora,      beach).
avoid_if(evora,      coast).
avoid_if(braga,      beach).
avoid_if(braga,      coast).
avoid_if(guimaraes,  beach).
avoid_if(guimaraes,  coast).
avoid_if(obidos,     nightlife).
avoid_if(obidos,     urban).
avoid_if(nazare,     urban).
avoid_if(nazare,     nightlife).
avoid_if(nazare,     culture).
avoid_if(viana,      urban).
avoid_if(viana,      nightlife).
avoid_if(coimbra,    beach).
avoid_if(coimbra,    coast).
avoid_if(serra_da_estrela, beach).
avoid_if(serra_da_estrela, coast).
avoid_if(serra_da_estrela, nightlife).
avoid_if(acores,     urban).
avoid_if(acores,     nightlife).
avoid_if(madeira,    urban).
avoid_if(madeira,    nightlife).
avoid_if(setubal,    urban).
avoid_if(setubal,    nightlife).
avoid_if(cascais,    rural).
avoid_if(cascais,    authentic).
avoid_if(aveiro,     rural).

%  pair_well(DestA, DestB, Reason)

pair_well(porto,     douro,      'Wine culture: tour Port cellars then cruise the Douro vineyards').
pair_well(porto,     braga,      'Northern heritage: vibrant city then Portugal oldest city').
pair_well(porto,     guimaraes,  'History loop: Porto + medieval birthplace of Portugal').
pair_well(lisboa,    sintra,     'Essential combo: capital day trips to UNESCO fairy-tale palaces').
pair_well(lisboa,    cascais,    'Urban and coastal: city culture then Atlantic beach resort').
pair_well(lisboa,    evora,      'City + Alentejo: contrast Lisbon buzz with Roman quietude').
pair_well(evora,     alentejo,   'Deep Alentejo: Roman ruins then cork-oak plains and slow food').
pair_well(evora,     douro,      'Wine grand tour: Alentejo reds paired with Port wine country').
pair_well(sintra,    obidos,     'Palace trail: UNESCO palaces then a perfectly preserved walled village').
pair_well(faro,      lagos,      'Algarve sweep: eastern lagoon gateway to dramatic western cliffs').
pair_well(faro,      albufeira,  'Algarve classic: historical Faro base with Albufeira beach resort').
pair_well(coimbra,   aveiro,     'Centre pair: university town then the Venice of Portugal').
pair_well(coimbra,   nazare,     'Inland to coast: Portugal oldest university then giant-wave beach').
pair_well(aveiro,    porto,      'Quick northern circuit: canal town then Porto for a weekend').
pair_well(madeira,   acores,     'Island hopping: lush levadas then volcanic Azores wilderness').
pair_well(braga,     guimaraes,  'Sacred north: Baroque pilgrimage city + medieval castle town').
pair_well(douro,     viana,      'Northern nature loop: valley vineyards then folkloric coastal town').
pair_well(setubal,   alentejo,   'Nature escape: dolphin coast then cork-oak plains south of Lisbon').
pair_well(obidos,    nazare,     'Quick getaway: medieval village then dramatic surf beach nearby').
pair_well(lagos,     sagres,     'End of the world: cliffs and surf then Cape St. Vincent lighthouse').

%  warning(Dest, Month, Text)

warning(sintra,    jul, 'Extremely crowded - book palace tickets weeks ahead, go before 9am').
warning(sintra,    aug, 'Peak crowds - waits over 2h at Pena Palace; consider off-peak visit').
warning(lisboa,    jul, 'City is very busy - accommodation prices spike, book early').
warning(lisboa,    aug, 'Peak tourist season - some local restaurants close for August holidays').
warning(albufeira, jul, 'Party resort at peak - noise levels high, beach very crowded').
warning(albufeira, aug, 'Extreme summer crowds - prices are at yearly high, book 3+ months ahead').
warning(lagos,     aug, 'Very popular - parking and beaches packed; consider nearby quieter coves').
warning(faro,      jul, 'Hot and busy - 30C+, airport traffic heavy, car rental scarce').
warning(faro,      aug, 'Hottest month - 31C average, sunstroke risk; stay hydrated outdoors').
warning(alentejo,  jul, 'Intense heat - temperatures can exceed 40C in July and August').
warning(alentejo,  aug, 'Extreme heat - rural areas offer little shade; plan for midday rest').
warning(evora,     aug, 'Very hot - Roman sights are exposed, visit early morning or evening').
warning(porto,     jan, 'Rainy month - pack waterproofs; indoor wine cellar visits are ideal').
warning(porto,     feb, 'Cool and rainy - low season prices but wet streets; good for museums').
warning(acores,    jan, 'Stormy season - some inter-island flights may be disrupted').
warning(acores,    feb, 'Unpredictable weather - carry layers; whale watching not yet in season').
warning(nazare,    nov, 'Big wave season - Praia do Norte may be closed to swimmers; spectacular viewing').
warning(nazare,    dec, 'Big waves continue - check surf forecasts before swimming').
warning(madeira,   feb, 'Carnival month - hotels book up fast; Funchal very busy during Carnival week').
warning(douro,     sep, 'Harvest season (Vindima) - quintas fill up fast; book accommodation early').
warning(serra_da_estrela, jan, 'Snow possible - roads may close; check conditions before driving').
warning(serra_da_estrela, feb, 'Peak snow month - 4WD recommended on mountain roads').
warning(braga,     apr, 'Holy Week brings large crowds to religious processions; book ahead').
warning(cascais,   aug, 'Very busy with Lisbon day-trippers; beaches crowded by midday').

%  visa(Nationality, SchengenMember, RequiresVisa, MaxStayDays, Notes)

visa(eu_citizen,         yes, no,  unlimited, 'Full freedom of movement within EU/EEA').
visa(uk_citizen,         no,  no,  90,        'Post-Brexit: 90 days in any 180-day period, no visa needed').
visa(us_citizen,         no,  no,  90,        'No visa for tourism up to 90 days in Schengen area').
visa(canadian,           no,  no,  90,        'No visa for tourism up to 90 days in Schengen area').
visa(australian,         no,  no,  90,        'No visa for tourism up to 90 days in Schengen area').
visa(new_zealander,      no,  no,  90,        'No visa for tourism up to 90 days in Schengen area').
visa(japanese,           no,  no,  90,        'No visa for tourism up to 90 days in Schengen area').
visa(south_korean,       no,  no,  90,        'No visa for tourism up to 90 days in Schengen area').
visa(brazilian,          no,  no,  90,        'No visa - special bilateral agreement; 90 days allowed').
visa(indian,             no,  yes, 90,        'Schengen visa required; apply at Portuguese embassy').
visa(chinese,            no,  yes, 90,        'Schengen visa required; apply 3-4 weeks in advance').
visa(russian,            no,  yes, 90,        'Schengen visa required; processing may be slower currently').
visa(south_african,      no,  yes, 90,        'Schengen visa required; apply at Portuguese consulate').
visa(moroccan,           no,  yes, 90,        'Schengen visa required; apply at Portuguese consulate').
visa(other,              no,  yes, 90,        'Check with Portuguese embassy; Schengen visa likely required').

%  profile(Name, PreferenceTags, AvoidTags, IdealStyle, Notes)

profile(romantic_couple,    [romantic, scenic, wine, food, culture],
                             [nightlife, urban],
                             mid,
                             'Focus on atmosphere, scenery, local gastronomy').

profile(budget_backpacker,  [urban, nightlife, culture, historic, food],
                             [luxury, upscale],
                             budget,
                             'Hostels, day trips, public transport, free museums').

profile(family_with_kids,   [family, beach, coast, child_friendly, sunny],
                             [nightlife, remote],
                             mid,
                             'Safety, child activities, easy transport, beach access').

profile(history_buff,       [historic, culture, museums, medieval, roman, fado],
                             [beach, resort, nightlife],
                             mid,
                             'Archaeological sites, museums, guided tours').

profile(nature_adventurer,  [nature, hiking, outdoor, scenic, mountain, island],
                             [urban, nightlife, resort],
                             budget,
                             'Trails, national parks, wildlife, physical activities').

profile(foodie_explorer,    [food, wine, gastronomy, culture, markets],
                             [remote, mountain],
                             mid,
                             'Wine regions, food tours, local markets, cooking classes').

profile(sun_seeker,         [beach, sunny, coast, summer, warm],
                             [mountain, cold, rainy],
                             mid,
                             'Beach clubs, water sports, outdoor dining, sunshine').

profile(slow_traveler,      [rural, authentic, slow_travel, nature, traditional],
                             [urban, nightlife, crowds, resort],
                             mid,
                             'Off the beaten path, local life, long stays').

profile(luxury_traveler,    [upscale, scenic, wine, food, culture, historic],
                             [budget, crowds, remote],
                             luxury,
                             'Design hotels, private tours, fine dining, spa').

%  REGIONAL STATS (Pordata-inspired)

region_stat(north,  tourism_index,    72).
region_stat(center, tourism_index,   110).
region_stat(south,  tourism_index,   145).
region_stat(island, tourism_index,    88).

region_stat(north,  avg_monthly_wage, 1050).
region_stat(center, avg_monthly_wage, 1120).
region_stat(south,  avg_monthly_wage,  980).
region_stat(island, avg_monthly_wage, 1010).

region_stat(north,  safety_index,     75).
region_stat(center, safety_index,     72).
region_stat(south,  safety_index,     78).
region_stat(island, safety_index,     88).

%  CONNECTIVITY (geographic proximity in km)

connected(lisboa,    sintra,            28).
connected(lisboa,    cascais,           33).
connected(lisboa,    setubal,           50).
connected(lisboa,    obidos,            85).
connected(lisboa,    nazare,           120).
connected(lisboa,    evora,            130).
connected(lisboa,    faro,             280).

connected(obidos,    nazare,            40).
connected(nazare,    coimbra,          110).
connected(coimbra,   serra_da_estrela, 120).
connected(coimbra,   aveiro,            65).
connected(aveiro,    porto,             75).

connected(porto,     braga,             55).
connected(porto,     guimaraes,         55).
connected(porto,     viana,             75).
connected(porto,     douro,             90).

connected(braga,     guimaraes,         25).

connected(evora,     alentejo,          60).
connected(evora,     faro,             220).

connected(faro,      albufeira,         45).
connected(albufeira, lagos,             60).
connected(faro,      lagos,             90).

%  BEST_FOR facts (curated knowledge)

best_for(porto,            wine_lovers).
best_for(douro,            wine_lovers).
best_for(alentejo,         wine_lovers).
best_for(lagos,            beach_lovers).
best_for(albufeira,        beach_lovers).
best_for(cascais,          beach_lovers).
best_for(nazare,           beach_lovers).
best_for(madeira,          hikers).
best_for(acores,           hikers).
best_for(serra_da_estrela, hikers).
best_for(sintra,           history_buffs).
best_for(evora,            history_buffs).
best_for(obidos,           history_buffs).
best_for(coimbra,          history_buffs).
best_for(guimaraes,        history_buffs).
best_for(braga,            history_buffs).
best_for(lisboa,           foodies).
best_for(porto,            foodies).
best_for(alentejo,         foodies).
best_for(lisboa,           nightlife_seekers).
best_for(porto,            nightlife_seekers).
best_for(albufeira,        nightlife_seekers).
best_for(lagos,            nightlife_seekers).
best_for(albufeira,        families).
best_for(cascais,          families).
best_for(madeira,          families).
best_for(sintra,           couples).
best_for(douro,            couples).
best_for(obidos,           couples).
best_for(aveiro,           couples).

%  VALIDATION & BASE LOGIC

month(jan). month(feb). month(mar). month(apr).
month(may). month(jun). month(jul). month(aug).
month(sep). month(oct). month(nov). month(dec).

valid_month(M) :- month(M).
valid_month(M) :-
    \+ month(M),
    format("~n  [!] '~w' is not a valid month. Use: jan feb mar apr may jun jul aug sep oct nov dec~n", [M]),
    fail.

valid_style(budget).
valid_style(mid).
valid_style(luxury).
valid_style(S) :-
    \+ member(S, [budget, mid, luxury]),
    format("~n  [!] '~w' is not a valid style. Use: budget  mid  luxury~n", [S]),
    fail.

valid_destination(D) :- destination(D, _, _).
valid_destination(D) :-
    \+ destination(D, _, _),
    format("~n  [!] '~w' is not in our database. See available cities above.~n", [D]),
    fail.

valid_tags([]).
valid_tags([T|Rest]) :-
    (   destination(_, _, Tags), member(T, Tags)
    ->  valid_tags(Rest)
    ;   format("~n  [!] '~w' is not a known tag. Ignoring it.~n", [T]),
        valid_tags(Rest)
    ).

%  CORE RULES

daily_budget(Dest, Style, Days, Total) :-
    cost(Dest, Style, Accom, Meal, Transport),
    Daily is Accom + (Meal * 3) + Transport,
    Total is Daily * Days.

trip_cost(Dest, Style, Days, Total) :-
    daily_budget(Dest, Style, Days, Total).

% Multi-city budget: list of dest-days pairs, one style
multi_city_cost([], _, 0).
multi_city_cost([Dest-Days|Rest], Style, Total) :-
    trip_cost(Dest, Style, Days, C),
    multi_city_cost(Rest, Style, RestTotal),
    Total is C + RestTotal.

recommend(Prefs, Month, Dest) :-
    destination(Dest, _, Tags),
    month(Month),
    weather(Dest, Month, Cond, _),
    \+ Cond = rainy,
    preferences_match(Prefs, Tags).

preferences_match([], _).
preferences_match([P|Rest], Tags) :-
    member(P, Tags),
    preferences_match(Rest, Tags).

score_destination(Dest, Prefs, Score) :-
    destination(Dest, _, Tags),
    include(tag_in(Tags), Prefs, Matched),
    length(Matched, Score).

tag_in(Tags, Tag) :- member(Tag, Tags).

recommend_relaxed(Prefs, Dest, Score) :-
    destination(Dest, _, _),
    score_destination(Dest, Prefs, Score),
    Score >= 1.

best_season(Dest, Month) :-
    month(Month),
    weather(Dest, Month, Cond, Temp),
    (Cond = sunny ; Cond = warm),
    Temp >= 18.

avoid_month(Dest, Month) :-
    month(Month),
    weather(Dest, Month, rainy, _).
avoid_month(Dest, Month) :-
    month(Month),
    weather(Dest, Month, _, Temp),
    Temp < 12.

nearby_trips(Base, Nearby) :-
    connected(Base, Nearby, Dist),
    Dist =< 100.
nearby_trips(Base, Nearby) :-
    connected(Nearby, Base, Dist),
    Dist =< 100.

within_budget(Dest, Style, MaxTotal, Days) :-
    trip_cost(Dest, Style, Days, Cost),
    Cost =< MaxTotal.

safe_destination(Dest) :-
    destination(Dest, Region, _),
    region_stat(Region, safety_index, SI),
    SI >= 75.

cheapest_option(Prefs, Month, Days, BestDest, LowestCost) :-
    findall(Cost-Dest, (
        recommend(Prefs, Month, Dest),
        trip_cost(Dest, budget, Days, Cost)
    ), Pairs),
    Pairs \= [],
    msort(Pairs, [LowestCost-BestDest|_]).

% Infer traveler profile from answers
% Infer traveler profile by dynamically scoring all profiles
infer_profile(Answers, Style, BestProfile) :-
    findall(Score-Profile, (
        profile(Profile, PreferenceTags, _, IdealStyle, _),
        intersection(Answers, PreferenceTags, Matched),
        length(Matched, BaseScore),
        (IdealStyle = Style -> StyleBonus = 3 ; StyleBonus = 0),        
        Score is BaseScore + StyleBonus,
        Score > 0
    ), ScoredProfiles),
    ScoredProfiles \= [],
    msort(ScoredProfiles, Sorted),
    reverse(Sorted, [_-BestProfile|_]),
    !.
infer_profile(_, slow_traveler).   % safe fallback

% Crowd-aware recommendation: penalise extreme crowd levels
crowd_penalty(extreme, 3).
crowd_penalty(high,    1).
crowd_penalty(medium,  0).
crowd_penalty(low,     0).

scored_recommend(Prefs, Month, Dest, AdjScore) :-
    recommend_relaxed(Prefs, Dest, BaseScore),
    (crowd_level(Dest, Month, Level) -> true ; Level = medium),
    crowd_penalty(Level, Penalty),
    AdjScore is BaseScore - Penalty,
    AdjScore >= 1.

%  ITINERARY BUILDER

suggested_itinerary(Days, _, [lisboa]) :-
    Days =< 3, !.
suggested_itinerary(Days, _, [porto, douro]) :-
    Days > 3, Days =< 5, !.
suggested_itinerary(Days, budget, [lisboa, sintra, obidos, coimbra, porto]) :-
    Days > 5, Days =< 8, !.
suggested_itinerary(Days, mid, [lisboa, sintra, cascais, alentejo, porto]) :-
    Days > 5, Days =< 8, !.
suggested_itinerary(Days, luxury, [lisboa, sintra, evora, douro, porto]) :-
    Days > 5, Days =< 8, !.
suggested_itinerary(Days, _, [lisboa, sintra, evora, alentejo, lagos, porto, douro]) :-
    Days > 8, Days =< 14, !.
suggested_itinerary(Days, _, [lisboa, sintra, evora, alentejo, faro, lagos, coimbra, aveiro, porto, braga]) :-
    Days > 14.

%  EXPLAIN / WHY

explain_recommendation(Dest, Prefs, Month, Style, Days) :-
    destination(Dest, Region, Tags),
    weather(Dest, Month, Cond, Temp),
    trip_cost(Dest, Style, Days, Cost),
    intersection(Prefs, Tags, Matched),
    (crowd_level(Dest, Month, CrowdLvl) -> true ; CrowdLvl = medium),
    nl,
    format("  +--------------------------------------------------+~n"),
    format("  | Destination : ~w~n", [Dest]),
    format("  | Region      : ~w~n", [Region]),
    format("  | Tags match  : ~w~n", [Matched]),
    format("  | Weather     : ~w, ~w C  (~w)~n", [Cond, Temp, Month]),
    format("  | Crowd level : ~w~n", [CrowdLvl]),
    format("  | Est. cost   : EUR ~w  (~w style, ~w days)~n", [Cost, Style, Days]),
    % Show any warnings
    (   warning(Dest, Month, Warn)
    ->  format("  | WARNING     : ~w~n", [Warn])
    ;   true
    ),
    % Show special accommodation
    (   accommodation_type(Dest, AccType, AccDesc)
    ->  format("  | Stay        : ~w - ~w~n", [AccType, AccDesc])
    ;   true
    ),
    format("  +--------------------------------------------------+~n"),
    % Events this month
    findall(Ev, event(Dest, Ev, Month, _), Evs),
    (   Evs \= []
    ->  format("  Events in ~w during ~w:~n", [Dest, Month]),
        forall(member(E, Evs), format("    ~ ~w~n", [E]))
    ;   true
    ).

%  MENU SYSTEM

start :-
    nl,
    format("  ==========================================~n"),
    format("      PORTUGAL TOURIST ADVISOR             ~n"),
    format("      Powered by Prolog + Numbeo/Pordata   ~n"),
    format("  ==========================================~n"),
    menu.

menu :-
    nl,
    format("  ==========================================~n"),
    format("                 MAIN MENU                  ~n"),
    format("  ==========================================~n"),
    format("  1.  Find cheapest destination             ~n"),
    format("  2.  Find day trips from a base city       ~n"),
    format("  3.  Get a suggested itinerary             ~n"),
    format("  4.  Check if a city fits my budget        ~n"),
    format("  5.  Profile me & get recommendations      ~n"),
    format("  6.  Events & festivals by month           ~n"),
    format("  7.  Transport between two cities          ~n"),
    format("  8.  Multi-city trip cost                  ~n"),
    format("  9.  Visa information by nationality       ~n"),
    format("  10. Good city pairs (what goes with what) ~n"),
    format("  11. Accessibility & special needs         ~n"),
    format("  0.  Exit                                  ~n"),
    format("  ==========================================~n"),
    format("  Choice (0-11): "),
    read(Choice),
    handle_choice(Choice).

% --- CHOICE 1: Cheapest destination ---
handle_choice(1) :-
    nl,
    format("  --- FIND CHEAPEST DESTINATION ---~n"),
    nl,
    list_tags,
    format("  Interests as a list (e.g. [wine, romantic] or []):~n  > "),
    read(Tags),
    valid_tags(Tags),
    nl,
    list_months,
    format("  Travel month (jan..dec):~n  > "),
    read(Month),
    (   valid_month(Month)
    ->  nl,
        format("  Number of days:~n  > "),
        read(Days),
        (   integer(Days), Days > 0
        ->  nl,
            (   cheapest_option(Tags, Month, Days, BestDest, LowestCost)
            ->  format("  >>> Cheapest strict match: ~w~n", [BestDest]),
                format("  >>> Estimated budget cost for ~w days: EUR ~w~n", [Days, LowestCost]),
                explain_recommendation(BestDest, Tags, Month, budget, Days),
                findall(C-D, (recommend(Tags, Month, D), trip_cost(D, budget, Days, C)), AllPairs),
                msort(AllPairs, Sorted),
                length(Sorted, N),
                format("~n  (~w destinations matched your criteria in ~w)~n", [N, Month])
            ;   format("  No strict match found for ~w in ~w.~n", [Tags, Month]),
                nl,
                (   Tags \= []
                ->  findall(Score-Dest, recommend_relaxed(Tags, Dest, Score), Candidates),
                    msort(Candidates, Sorted0),
                    reverse(Sorted0, [_-TopDest|_]),
                    format("  Closest match ignoring weather: ~w~n", [TopDest]),
                    explain_recommendation(TopDest, Tags, Month, budget, Days),
                    format("  Tip: best months for ~w are: ", [TopDest]),
                    findall(M, best_season(TopDest, M), BestMs),
                    format("~w~n", [BestMs])
                ;   findall(C-D, (destination(D,_,_), weather(D,Month,Cond,_), \+ Cond = rainy, trip_cost(D,budget,Days,C)), Pairs),
                    msort(Pairs, [LowestC-AnyDest|_]),
                    format("  Cheapest destination in ~w (no filters): ~w  EUR ~w~n", [Month, AnyDest, LowestC]),
                    explain_recommendation(AnyDest, [], Month, budget, Days)
                )
            )
        ;   format("~n  [!] Please enter a positive integer for days (e.g. 5).~n")
        )
    ;   true
    ),
    continue_or_exit.

% --- CHOICE 2: Day trips ---
handle_choice(2) :-
    nl,
    format("  --- DAY TRIPS ---~n"),
    nl,
    list_cities,
    format("  Base city (e.g. lisboa):~n  > "),
    read(Base),
    (   valid_destination(Base)
    ->  findall(Dest-Dist, (connected(Base, Dest, Dist), Dist =< 100), Pairs1),
        findall(Dest-Dist, (connected(Dest, Base, Dist), Dist =< 100), Pairs2),
        append(Pairs1, Pairs2, AllPairs),
        sort(AllPairs, Trips),
        nl,
        (   Trips \= []
        ->  format("  Day trips within 100 km of ~w:~n", [Base]),
            forall(member(D-Km, Trips), (
                format("    - ~w  (~w km)", [D, Km]),
                (   transport(Base, D, Mode, Dur, Cost)
                ->  format("  [~w, ~w min, EUR ~w]~n", [Mode, Dur, Cost])
                ;   transport(D, Base, Mode, Dur, Cost)
                ->  format("  [~w, ~w min, EUR ~w]~n", [Mode, Dur, Cost])
                ;   format("~n")
                )
            ))
        ;   format("  No day trips recorded within 100 km of ~w.~n", [Base]),
            format("  Tip: try lisboa, porto, or coimbra as base cities.~n")
        )
    ;   true
    ),
    continue_or_exit.

% --- CHOICE 3: Suggested itinerary ---
handle_choice(3) :-
    nl,
    format("  --- SUGGESTED ITINERARY ---~n"),
    nl,
    format("  Trip length in days:~n  > "),
    read(Days),
    (   integer(Days), Days > 0
    ->  nl,
        format("  Travel style (budget / mid / luxury):~n  > "),
        read(Style),
        (   valid_style(Style)
        ->  nl,
            format("  Travel month (for event info, jan..dec):~n  > "),
            read(Month),
            suggested_itinerary(Days, Style, Route),
            nl,
            length(Route, Stops),
            format("  Suggested ~w-stop route for ~w days (~w):~n", [Stops, Days, Style]),
            print_route_with_info(Route, 1, Month, Style, Days)
        ;   true
        )
    ;   format("~n  [!] Please enter a positive integer for days (e.g. 7).~n")
    ),
    continue_or_exit.

% --- CHOICE 4: Budget check ---
handle_choice(4) :-
    nl,
    format("  --- BUDGET CHECK ---~n"),
    nl,
    list_cities,
    format("  City to visit (e.g. porto):~n  > "),
    read(City),
    (   valid_destination(City)
    ->  nl,
        format("  Maximum total budget in EUR (e.g. 500):~n  > "),
        read(MaxBudget),
        (   number(MaxBudget), MaxBudget > 0
        ->  nl,
            format("  Number of days (e.g. 4):~n  > "),
            read(Days),
            (   integer(Days), Days > 0
            ->  nl,
                check_budget_styles(City, MaxBudget, Days)
            ;   format("~n  [!] Please enter a positive integer for days.~n")
            )
        ;   format("~n  [!] Please enter a positive number for budget.~n")
        )
    ;   true
    ),
    continue_or_exit.

% --- CHOICE 5: Profile & Recommend ---
% --- CHOICE 5: Profile & Recommend ---
handle_choice(5) :-
    nl,
    format("  --- TRAVELER PROFILE & RECOMMENDATIONS ---~n"),
    nl,
    format("  Travel style (budget / mid / luxury):~n  > "),
    read(Style),
    nl,
    format("  Answer a few questions to find your travel profile.~n~n"),
    format("  What matters most to you? (pick all that apply as a list)~n"),
    format("  Options: [wine, beach, hiking, culture, nightlife, food,~n"),
    format("            history, nature, romance, family,~n"),
    format("            authentic, slow_travel, adventure, art]~n"),
    format("  > "),
    read(Interests),
    nl,
    format("  Any must-haves? (list, or [])~n"),
    format("  e.g. [child_friendly, wheelchair_friendly, english_widely_spoken]~n"),
    format("  > "),
    read(MustHave),
    nl,
    format("  Travel month (jan..dec):~n  > "),
    read(Month),
    nl,
    format("  Number of days:~n  > "),
    read(Days),
    (   valid_month(Month), integer(Days), Days > 0
    ->  nl,
        infer_profile(Interests, Style, Profile),
        profile(Profile, PrefTags, AvoidTags, IdealStyle, ProfileNotes),
        format("  >>> Your profile: ~w~n", [Profile]),
        format("  >>> ~w~n", [ProfileNotes]),
        nl,
        % Find crowd-aware scored recommendations using the Profile's core tags
        findall(Score-Dest, scored_recommend(PrefTags, Month, Dest, Score), Candidates),
        (   Candidates \= []
        ->  msort(Candidates, Sorted0),
            reverse(Sorted0, TopCandidates),
            % Filter out avoided tags and check accessibility
            findall(D, (
                member(_-D, TopCandidates),
                \+ (avoid_if(D, AvTag), member(AvTag, AvoidTags)),
                \+ (avoid_if(D, InterestTag), member(InterestTag, Interests)),
                % Use -> (If/Then) to prevent duplicate realities
                (MustHave = [] -> true ; forall(member(AF, MustHave), accessibility(D, AF)))
            ), GoodDests),
            (   GoodDests = [D1|Rest]
            ->  format("  Top recommendations for ~w:~n~n", [Profile]),
                % FIX: Pass "Interests" instead of "PrefTags" so the UI matches the user's input
                explain_recommendation(D1, Interests, Month, IdealStyle, Days),
                nl,
                (   Rest = [D2|Rest2]
                ->  format("  Also consider:~n"),
                    format("    - ~w~n", [D2]),
                    (   Rest2 = [D3|_]
                    ->  format("    - ~w~n", [D3])
                    ;   true
                    )
                ;   true
                ),
                % Pairs suggestion
                nl,
                (   pair_well(D1, Paired, Reason)
                ->  format("  Pairs well with: ~w~n", [Paired]),
                    format("  Why: ~w~n", [Reason])
                ;   pair_well(Paired, D1, Reason)
                ->  format("  Pairs well with: ~w~n", [Paired]),
                    format("  Why: ~w~n", [Reason])
                ;   true
                )
            ;   format("  No destinations matched all your must-haves. Try relaxing constraints.~n")
            )
        ;   format("  No scored matches in ~w. Try a different month.~n", [Month])
        )
    ;   format("~n  [!] Invalid month or days.~n")
    ),
    continue_or_exit.

% --- CHOICE 6: Events & Festivals ---
handle_choice(6) :-
    nl,
    format("  --- EVENTS & FESTIVALS ---~n"),
    nl,
    list_months,
    format("  Month to check (jan..dec), or 'all' for everything:~n  > "),
    read(Input),
    nl,
    (   Input = all
    ->  format("  All events in the knowledge base:~n~n"),
        forall(month(M), (
            findall(D-Name-Type, event(D, Name, M, Type), Evs),
            (   Evs \= []
            ->  format("  [ ~w ]~n", [M]),
                forall(member(Dest-EvName-EvType, Evs),
                    format("    ~w  |  ~w  (~w)~n", [Dest, EvName, EvType]))
            ;   true
            )
        ))
    ;   valid_month(Input),
        findall(D-Name-Type, event(D, Name, Input, Type), Evs),
        (   Evs \= []
        ->  format("  Events in ~w:~n~n", [Input]),
            forall(member(Dest-EvName-EvType, Evs),
                format("    ~w  |  ~w  (~w)~n", [Dest, EvName, EvType]))
        ;   format("  No events recorded for ~w.~n", [Input])
        )
    ),
    continue_or_exit.

% --- CHOICE 7: Transport ---
handle_choice(7) :-
    nl,
    format("  --- TRANSPORT BETWEEN CITIES ---~n"),
    nl,
    list_cities,
    format("  From city:~n  > "),
    read(From),
    nl,
    format("  To city:~n  > "),
    read(To),
    nl,
    (   valid_destination(From), valid_destination(To)
    ->  findall(Mode-Dur-Cost, transport(From, To, Mode, Dur, Cost), Options1),
        findall(Mode-Dur-Cost, transport(To, From, Mode, Dur, Cost), Options2Raw),
        (Options1 \= [] -> Options = Options1 ; Options = Options2Raw),
        (   Options \= []
        ->  format("  Transport from ~w to ~w:~n~n", [From, To]),
            forall(member(Mode-Dur-Cost, Options),
                format("    [~w]  ~w minutes  |  EUR ~w~n", [Mode, Dur, Cost]))
        ;   format("  No direct transport recorded between ~w and ~w.~n", [From, To]),
            format("  Consider routing via Lisboa or Porto.~n")
        )
    ;   true
    ),
    continue_or_exit.

% --- CHOICE 8: Multi-city cost ---
handle_choice(8) :-
    nl,
    format("  --- SMART MULTI-CITY CALCULATOR ---~n"),
    nl,
    format("  Enter your stops as a list of Destination-Days pairs.~n"),
    format("  Example: [lisboa-3, porto-2, douro-1]~n  > "),
    read(StopList),
    nl,
    format("  Travel style (budget / mid / luxury):~n  > "),
    read(Style),
    (   valid_style(Style), is_list(StopList)
    ->  nl,
        % Validate each stop so we know exactly what is broken
        (   validate_stops(StopList)
        ->  calculate_smart_trip(StopList, Style, 0, 0, TotalAccom, TotalTrans),
            GrandTotal is TotalAccom + TotalTrans,
            
            format("  ~w Style Breakdown:~n~n", [Style]),
            print_smart_trip(StopList, Style),
            
            format("  ----------------------------------------~n"),
            format("  City Stays & Meals : EUR ~w~n", [TotalAccom]),
            format("  Inter-city Transit : EUR ~w~n", [TotalTrans]),
            format("  GRAND TOTAL        : EUR ~w~n~n", [GrandTotal]),
            length(StopList, NumStops),
            format("  (~w stops calculated)~n", [NumStops])
        ;   format("  [!] Calculation aborted due to invalid input.~n")
        )
    ;   format("  [!] Invalid style or you did not enter a valid list format.~n")
    ),
    continue_or_exit.

validate_stops([]).
validate_stops([D-Days|Rest]) :-
    (   valid_destination(D)
    ->  (   integer(Days), Days > 0
        ->  validate_stops(Rest)
        ;   format("  [!] Invalid number of days for ~w. Must be an integer > 0.~n", [D]), fail
        )
    ;   fail 
    ).
validate_stops([Other|_]) :-
    format("  [!] Invalid format: '~w'. Use Destination-Days (e.g. porto-3).~n", [Other]),
    fail.

% Calculate recursive leg costs + inter-city transit costs
calculate_smart_trip([], _, Accom, Trans, Accom, Trans).
calculate_smart_trip([D-Days], Style, AccAccom, AccTrans, TotalAccom, TotalTrans) :-
    trip_cost(D, Style, Days, C),
    TotalAccom is AccAccom + C,
    TotalTrans is AccTrans.
calculate_smart_trip([D1-Days1, D2-Days2 | Rest], Style, AccAccom, AccTrans, TotalAccom, TotalTrans) :-
    trip_cost(D1, Style, Days1, C1),
    get_transport_cost(D1, D2, TransCost),
    NewAccom is AccAccom + C1,
    NewTrans is AccTrans + TransCost,
    calculate_smart_trip([D2-Days2 | Rest], Style, NewAccom, NewTrans, TotalAccom, TotalTrans).

% Print visual breakdown of the trip with transit
print_smart_trip([D-Days], Style) :-
    trip_cost(D, Style, Days, C),
    format("    ~w (~w days) = EUR ~w~n", [D, Days, C]).
print_smart_trip([D1-Days1, D2-Days2 | Rest], Style) :-
    trip_cost(D1, Style, Days1, C),
    get_transport_cost(D1, D2, TransCost),
    format("    ~w (~w days) = EUR ~w~n", [D1, Days1, C]),
    (   transport(D1, D2, Mode, Dur, TransCost)
    ->  format("      -> Transit to ~w: ~w (~w mins) = EUR ~w~n", [D2, Mode, Dur, TransCost])
    ;   transport(D2, D1, Mode, Dur, TransCost)
    ->  format("      -> Transit to ~w: ~w (~w mins) = EUR ~w~n", [D2, Mode, Dur, TransCost])
    ;   format("      -> Transit to ~w: estimated = EUR ~w~n", [D2, TransCost])
    ),
    print_smart_trip([D2-Days2 | Rest], Style).

% --- CHOICE 9: Visa Info ---
handle_choice(9) :-
    nl,
    format("  --- VISA INFORMATION ---~n"),
    nl,
    format("  Nationalities in database:~n"),
    format("  eu_citizen, uk_citizen, us_citizen, canadian, australian,~n"),
    format("  new_zealander, japanese, south_korean, brazilian, indian,~n"),
    format("  chinese, russian, south_african, moroccan, other~n~n"),
    format("  Your nationality (e.g. uk_citizen):~n  > "),
    read(Nat),
    nl,
    (   visa(Nat, Schengen, NeedsVisa, MaxDays, Notes)
    ->  format("  Visa info for ~w:~n~n", [Nat]),
        format("    Schengen member : ~w~n", [Schengen]),
        format("    Visa required   : ~w~n", [NeedsVisa]),
        format("    Max stay (days) : ~w~n", [MaxDays]),
        format("    Notes           : ~w~n", [Notes])
    ;   format("  Nationality '~w' not found. Use 'other' for a generic answer.~n", [Nat])
    ),
    continue_or_exit.

% --- CHOICE 10: City Pairs ---
handle_choice(10) :-
    nl,
    format("  --- CITY PAIRS (what goes well together) ---~n"),
    nl,
    format("  Enter a city to find what pairs well with it,~n"),
    format("  or 'all' to list every pairing:~n  > "),
    read(Input),
    nl,
    (   Input = all
    ->  format("  All recommended city pairs:~n~n"),
        forall(pair_well(A, B, Reason),
            format("  ~w  +  ~w~n    ~w~n~n", [A, B, Reason]))
    ;   valid_destination(Input),
        findall(B-R, pair_well(Input, B, R), Pairs1),
        findall(A-R, pair_well(A, Input, R), Pairs2),
        append(Pairs1, Pairs2, AllPairs),
        (   AllPairs \= []
        ->  format("  Good pairings for ~w:~n~n", [Input]),
            forall(member(Other-Reason, AllPairs),
                format("  + ~w~n    ~w~n~n", [Other, Reason]))
        ;   format("  No specific pairings recorded for ~w.~n", [Input])
        )
    ),
    continue_or_exit.

% --- CHOICE 11: Accessibility ---
handle_choice(11) :-
    nl,
    format("  --- ACCESSIBILITY & SPECIAL NEEDS ---~n"),
    nl,
    format("  Features available:~n"),
    format("  wheelchair_friendly, english_widely_spoken, child_friendly,~n"),
    format("  senior_friendly, pet_friendly, vegetarian_options~n~n"),
    format("  Enter required features as a list (e.g. [wheelchair_friendly, child_friendly]):~n  > "),
    read(Features),
    nl,
    findall(D, (
        destination(D, _, _),
        forall(member(F, Features), accessibility(D, F))
    ), Matching),
    (   Matching \= []
    ->  format("  Destinations matching ~w:~n", [Features]),
        forall(member(D, Matching), (
            destination(D, Region, _),
            format("    - ~w  (~w)~n", [D, Region])
        ))
    ;   format("  No destinations found with all features: ~w~n", [Features])
    ),
    continue_or_exit.

% --- CHOICE 0: Exit ---
handle_choice(0) :-
    nl,
    format("  Obrigado! Safe travels through Portugal.~n~n").

handle_choice(Other) :-
    nl,
    format("  [!] '~w' is not a valid option. Please enter 0-11.~n", [Other]),
    continue_or_exit.

%  HELPERS

list_tags :-
    findall(T, (destination(_, _, Tags), member(T, Tags)), RawTags),
    sort(RawTags, UniqueTags),
    format("  Available tags: ~w~n", [UniqueTags]).

list_months :-
    findall(M, month(M), Months),
    format("  Available months: ~w~n", [Months]).

list_cities :-
    findall(C, destination(C, _, _), Cities),
    format("  Available cities: ~w~n", [Cities]).

print_route_with_info([], _, _, _, _).
print_route_with_info([H|T], N, Month, Style, TotalDays) :-
    length_list(T, TLen),
    DaysHere is max(1, TotalDays // (N + TLen)),
    trip_cost(H, Style, DaysHere, StopCost),
    format("    ~w. ~w  (~w days, est. EUR ~w)~n", [N, H, DaysHere, StopCost]),
    findall(Ev, event(H, Ev, Month, _), Evs),
    (Evs \= [] -> format("       Events: ~w~n", [Evs]) ; true),
    (warning(H, Month, Warn) -> format("       [!] ~w~n", [Warn]) ; true),
    print_transport_to_next(H, T),
    N1 is N + 1,
    print_route_with_info(T, N1, Month, Style, TotalDays).

print_transport_to_next(_, []) :- !.
print_transport_to_next(H, [Next|_]) :-
    (   transport(H, Next, Mode, Dur, TCost)
    ->  format("       -> ~w to ~w: ~w, ~w min, EUR ~w~n", [H, Next, Mode, Dur, TCost])
    ;   true
    ).

length_list([], 0).
length_list([_|T], N) :- length_list(T, N0), N is N0 + 1.

check_budget_styles(City, MaxBudget, Days) :-
    format("  Budget check for ~w  (~w days, max EUR ~w):~n", [City, Days, MaxBudget]),
    nl,
    forall(
        member(Style, [budget, mid, luxury]),
        (   trip_cost(City, Style, Days, Cost),
            (   Cost =< MaxBudget
            ->  format("    [YES] ~w style  ---  EUR ~w  (fits!)~n", [Style, Cost])
            ;   Over is Cost - MaxBudget,
                format("    [NO]  ~w style  ---  EUR ~w  (over by EUR ~w)~n", [Style, Cost, Over])
            )
        )
    ),
    nl,
    (   accommodation_type(City, AccType, AccDesc)
    ->  format("  Signature stay: ~w - ~w~n", [AccType, AccDesc])
    ;   true
    ),
    nl,
    (   within_budget(City, budget, MaxBudget, Days)
    ->  true
    ;   trip_cost(City, budget, Days, BudgetCost),
        Shortfall is BudgetCost - MaxBudget,
        format("  Tip: even budget style is EUR ~w over your limit.~n", [Shortfall]),
        format("  Consider these cheaper alternatives:~n"),
        findall(C-D, (
            destination(D, _, _), D \= City,
            trip_cost(D, budget, Days, C), C =< MaxBudget
        ), Pairs),
        msort(Pairs, Sorted),
        (   Sorted \= []
        ->  Sorted = [C1-D1, C2-D2 | _],
            format("    - ~w  EUR ~w~n", [D1, C1]),
            format("    - ~w  EUR ~w~n", [D2, C2])
        ;   format("    (no destinations fit that budget for ~w days)~n", [Days])
        )
    ).

get_transport_cost(A, B, Cost) :- 
    transport(A, B, _, _, Cost), !.

get_transport_cost(A, B, Cost) :- 
    transport(B, A, _, _, Cost), !.

get_transport_cost(_, _, 15).

continue_or_exit :-
    nl,
    format("  [Enter 0 to return to menu, or 'exit' to quit]: "),
    read(K),
    (   K = exit -> handle_choice(0)
    ;   K == 0  -> menu
    ;   menu
    ).