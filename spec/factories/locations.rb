# encoding: utf-8

FactoryGirl.define do
  factory :location do
    factory :betahaus do
      name 'betahaus I Barcelona'
      foursquare_id '4fab92ade4b066f573d4bf89'
      latitude 41.4069647
      longitude 2.1568569
    end

    factory :gran_ceso do
      name 'Can Tresó'
      foursquare_id '4c49eac320ab1b8d4bb76c17'
      latitude 41.402982
      longitude 2.153739
    end

    factory :montjuic do
      name 'Muntanya de Montjuïc'
      foursquare_id '4d26c189342d6dcbb4c3e6ca'
      latitude 41.3641667
      longitude 2.1580556
    end

    factory :tibidabo do
      name 'Tibidabo'
      foursquare_id '4adcda50f964a520654121e3'
      latitude 41.4209857
      longitude 2.1187937
    end
    
    factory :random_location do
      after(:build) {|l| l.assign_attributes(locations_array.sample)}
    end
  end    
end

def locations_array
  [{:name=>"betahaus I Barcelona",
    :foursquare_id=>"4fab92ade4b066f573d4bf89",
    :latitude=>41.4068213080674,
    :longitude=>2.15666290852663},
   {:name=>"Las Fernández",
    :foursquare_id=>"4b4d9934f964a5209bd426e3",
    :latitude=>41.378166,
    :longitude=>2.16632902622223},
   {:name=>"Bodega Luis",
    :foursquare_id=>"4befed1cc601a593bf14c3d1",
    :latitude=>41.422642,
    :longitude=>2.178734},
   {:name=>"Arts Santa Mònica",
    :foursquare_id=>"4adcda52f964a520f54121e3",
    :latitude=>41.3771913282711,
    :longitude=>2.17598453999955},
   {:name=>"Pastisseria Hofmann",
    :foursquare_id=>"4b67e767f964a520af602be3",
    :latitude=>41.3850391038679,
    :longitude=>2.18279010894934},
   {:name=>"Heliogàbal",
    :foursquare_id=>"4adcda50f964a5200f4121e3",
    :latitude=>41.4034750324335,
    :longitude=>2.16026186943054},
   {:name=>"Granja Elena",
    :foursquare_id=>"4adcda55f964a520114321e3",
    :latitude=>41.362615,
    :longitude=>2.137123},
   {:name=>"Manjares",
    :foursquare_id=>"4b96e08bf964a520c9ea34e3",
    :latitude=>41.403157,
    :longitude=>2.15600742},
   {:name=>"The Institute for Advanced Architecture of Catalonia (IAAC)",
    :foursquare_id=>"4d371bae4754f04d5a5ba07e",
    :latitude=>41.396626,
    :longitude=>2.194337},
   {:name=>"Milano",
    :foursquare_id=>"4b511f4df964a520924327e3",
    :latitude=>41.3871330116034,
    :longitude=>2.16776931378867},
   {:name=>"Búnker del Carmel",
    :foursquare_id=>"4d18bf7f2d8c60fc7b0e05c7",
    :latitude=>41.419357,
    :longitude=>2.161688},
   {:name=>"Bitácora",
    :foursquare_id=>"4c4740850f5aa5938e4e7d76",
    :latitude=>41.3822253198321,
    :longitude=>2.18759494143191},
   {:name=>"Smoll Bar",
    :foursquare_id=>"4c8944bcda5da1cd97143be9",
    :latitude=>41.3813743161664,
    :longitude=>2.17847051719854},
   {:name=>"Conesa",
    :foursquare_id=>"4b5496f9f964a5207bc127e3",
    :latitude=>41.3828744776548,
    :longitude=>2.17711687088013},
   {:name=>"Quimet & Quimet",
    :foursquare_id=>"4adcda4df964a520064021e3",
    :latitude=>41.3740659842186,
    :longitude=>2.16551902573277},
   {:name=>"Tibidabo",
    :foursquare_id=>"4adcda50f964a520654121e3",
    :latitude=>41.4214584562173,
    :longitude=>2.11965322494507},
   {:name=>"Le Standard",
    :foursquare_id=>"4d51a8a39ffc236ac54825a7",
    :latitude=>41.405009,
    :longitude=>2.154921},
   {:name=>"Café Adonis 1940",
    :foursquare_id=>"4ba3f81ef964a520b57238e3",
    :latitude=>41.401093,
    :longitude=>2.164986},
   {:name=>"Jardins de Mossèn Costa i Llobera",
    :foursquare_id=>"502a8f69e4b022b4b562c457",
    :latitude=>41.3703127302226,
    :longitude=>2.17003890804659},
   {:name=>"Iposa",
    :foursquare_id=>"4bdc6737fed22d7f50ff57c9",
    :latitude=>41.3817963680935,
    :longitude=>2.16975580230331},
   {:name=>"Bar Lobo",
    :foursquare_id=>"4adcda4ef964a520954021e3",
    :latitude=>41.3832370002423,
    :longitude=>2.17048516308831},
   {:name=>"Humana",
    :foursquare_id=>"4de399108877bcb6865f2c65",
    :latitude=>41.3877341585586,
    :longitude=>2.17125292405194},
   {:name=>"Lupita del Raval",
    :foursquare_id=>"529c39da11d234f410da0723",
    :latitude=>41.3774436,
    :longitude=>2.1674123},
   {:name=>"La Taguara",
    :foursquare_id=>"4c82a4a1d34ca14373442e80",
    :latitude=>41.3856878704861,
    :longitude=>2.18241691589355},
   {:name=>"Fastvínic",
    :foursquare_id=>"4d0a80e1d8d78cfadf2617be",
    :latitude=>41.3891540345272,
    :longitude=>2.16526473586585},
   {:name=>"La Fonda Paisa",
    :foursquare_id=>"5012f96be4b0354629024b0c",
    :latitude=>41.4059816676905,
    :longitude=>2.17402656963772},
   {:name=>"L'Astrolabi",
    :foursquare_id=>"4adcda4ff964a520bf4021e3",
    :latitude=>41.399298545665,
    :longitude=>2.1597762634217},
   {:name=>"La Caseta del Migdia",
    :foursquare_id=>"4c225144502b95213ef86d21",
    :latitude=>41.3596228061907,
    :longitude=>2.16089885103064},
   {:name=>"El Rincón del Artista",
    :foursquare_id=>"4b888337f964a52058fd31e3",
    :latitude=>41.3751199171726,
    :longitude=>2.17021165140883},
   {:name=>"Bar Electricitat",
    :foursquare_id=>"4b82c0b2f964a5208be230e3",
    :latitude=>41.3794172652775,
    :longitude=>2.18968791575712},
   {:name=>"Gata Mala",
    :foursquare_id=>"4b6d7a8cf964a5202a772ce3",
    :latitude=>41.407813,
    :longitude=>2.157898},
   {:name=>"Oval",
    :foursquare_id=>"5153f82aebca1b14f73878dc",
    :latitude=>41.3897366885705,
    :longitude=>2.15924263000488},
   {:name=>"Kiosko",
    :foursquare_id=>"4d286bf8467d6ea8df09c695",
    :latitude=>41.3833252726783,
    :longitude=>2.18390822410583},
   {:name=>"Obsessions del Raval",
    :foursquare_id=>"4ccc7fc7ba0a54813dd63d59",
    :latitude=>41.3784619537721,
    :longitude=>2.16793725024571},
   {:name=>"Bar Tomás",
    :foursquare_id=>"4b55d3f8f964a520cdf127e3",
    :latitude=>41.3975393655659,
    :longitude=>2.12317800343414},
   {:name=>"Perifèric Bar Barcelona",
    :foursquare_id=>"4c098b6a009a0f47b5fbe7bf",
    :latitude=>41.4302549949964,
    :longitude=>2.16291861980536},
   {:name=>"Bodega E. Marín",
    :foursquare_id=>"4c001a1e369476b043dd8e1f",
    :latitude=>41.4025148408307,
    :longitude=>2.16087966126346},
   {:name=>"La Nena",
    :foursquare_id=>"4b64576ef964a520e5ab2ae3",
    :latitude=>41.4026461461466,
    :longitude=>2.15869009494781},
   {:name=>"El Rincón Maya",
    :foursquare_id=>"4cb76b8d9552b60c2fd0c48b",
    :latitude=>41.388907,
    :longitude=>2.158266},
   {:name=>"Super Lekker",
    :foursquare_id=>"529a18bc11d24f8413f2ca13",
    :latitude=>41.393634,
    :longitude=>2.16816},
   {:name=>"Centre Cultural Euskal Etxea",
    :foursquare_id=>"52e41ad6498ed01ea3f19ac9",
    :latitude=>41.384748,
    :longitude=>2.18211},
   {:name=>"La Paradeta",
    :foursquare_id=>"4bf2d95a94af2d7f45d23872",
    :latitude=>41.4051408204711,
    :longitude=>2.17329740524292},
   {:name=>"Le Nuvole",
    :foursquare_id=>"4e5556dffa76a1a43155854e",
    :latitude=>41.4042981832361,
    :longitude=>2.15867289265136},
   {:name=>"Heladería Delacrem",
    :foursquare_id=>"4bf69fb9004ed13a99c142a0",
    :latitude=>41.3881986083799,
    :longitude=>2.16178158917146},
   {:name=>"Woki Organic Market - Gracia",
    :foursquare_id=>"4d9772c7647d8cfa1872d53d",
    :latitude=>41.4031189684234,
    :longitude=>2.15404862447986},
   {:name=>"Jardin De Hara",
    :foursquare_id=>"50479d79e4b00b7e45e7da3a",
    :latitude=>41.4004410962014,
    :longitude=>2.16047644615173},
   {:name=>"Ansari \"El Costurer\"",
    :foursquare_id=>"4ed8c33e9911a3e78b2ad6dc",
    :latitude=>41.4002009712806,
    :longitude=>2.15742702320763},
   {:name=>"Mama's Café",
    :foursquare_id=>"4f92ac52e4b02d4702956a1c",
    :latitude=>41.403279,
    :longitude=>2.159013},
   {:name=>"Vespa Burguer",
    :foursquare_id=>"4f91d5bce4b020a51dcab92b",
    :latitude=>41.4020058592081,
    :longitude=>2.15734408639866},
   {:name=>"A Tu Bola",
    :foursquare_id=>"52ffc95e498e5f219673b9d1",
    :latitude=>41.3800667472058,
    :longitude=>2.16894968045028},
   {:name=>"Maians",
    :foursquare_id=>"4be598935254d13a1b8a60e1",
    :latitude=>41.3793642333333,
    :longitude=>2.19034855555556},
   {:name=>"Pesca Salada",
    :foursquare_id=>"4ca3a82eb0ff8cfa1b28b95e",
    :latitude=>41.378394,
    :longitude=>2.16547},
   {:name=>"La Bella Napoli",
    :foursquare_id=>"4b58677df964a5203f5628e3",
    :latitude=>41.37434747014,
    :longitude=>2.16379180208115},
   {:name=>"Federal Café",
    :foursquare_id=>"4c66d432ebfcb713aff11327",
    :latitude=>41.376923,
    :longitude=>2.16315},
   {:name=>"Niu: Espai Artístic Contemporani",
    :foursquare_id=>"4b6c3dd4f964a5205b2b2ce3",
    :latitude=>41.401525,
    :longitude=>2.196094},
   {:name=>"Turó Park",
    :foursquare_id=>"4b50c145f964a520093127e3",
    :latitude=>41.3945176719245,
    :longitude=>2.14081048965454},
   {:name=>"Flash Flash Tortillería",
    :foursquare_id=>"4adcda53f964a520434221e3",
    :latitude=>41.3966309395262,
    :longitude=>2.15222111436206}]
end
