--[[                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
                                                                                                                        
         tttt          FFFFFFFFFFFFFFFFFFFFFF                kkkkkkkk                          IIIIIIIIIIDDDDDDDDDDDDD        
      ttt:::t          F::::::::::::::::::::F                k::::::k                          I::::::::ID::::::::::::DDD     
      t:::::t          F::::::::::::::::::::F                k::::::k                          I::::::::ID:::::::::::::::DD   
      t:::::t          FF::::::FFFFFFFFF::::F                k::::::k                          II::::::IIDDD:::::DDDDD:::::D  
ttttttt:::::ttttttt      F:::::F       FFFFFFaaaaaaaaaaaaa    k:::::k    kkkkkkk eeeeeeeeeeee    I::::I    D:::::D    D:::::D 
t:::::::::::::::::t      F:::::F             a::::::::::::a   k:::::k   k:::::kee::::::::::::ee  I::::I    D:::::D     D:::::D
t:::::::::::::::::t      F::::::FFFFFFFFFF   aaaaaaaaa:::::a  k:::::k  k:::::ke::::::eeeee:::::eeI::::I    D:::::D     D:::::D
tttttt:::::::tttttt      F:::::::::::::::F            a::::a  k:::::k k:::::ke::::::e     e:::::eI::::I    D:::::D     D:::::D
      t:::::t            F:::::::::::::::F     aaaaaaa:::::a  k::::::k:::::k e:::::::eeeee::::::eI::::I    D:::::D     D:::::D
      t:::::t            F::::::FFFFFFFFFF   aa::::::::::::a  k:::::::::::k  e:::::::::::::::::e I::::I    D:::::D     D:::::D
      t:::::t            F:::::F            a::::aaaa::::::a  k:::::::::::k  e::::::eeeeeeeeeee  I::::I    D:::::D     D:::::D
      t:::::t    tttttt  F:::::F           a::::a    a:::::a  k::::::k:::::k e:::::::e           I::::I    D:::::D    D:::::D 
      t::::::tttt:::::tFF:::::::FF         a::::a    a:::::a k::::::k k:::::ke::::::::e        II::::::IIDDD:::::DDDDD:::::D  
      tt::::::::::::::tF::::::::FF         a:::::aaaa::::::a k::::::k  k:::::ke::::::::eeeeeeeeI::::::::ID:::::::::::::::DD   
        tt:::::::::::ttF::::::::FF          a::::::::::aa:::ak::::::k   k:::::kee:::::::::::::eI::::::::ID::::::::::::DDD     
          ttttttttttt  FFFFFFFFFFF           aaaaaaaaaa  aaaakkkkkkkk    kkkkkkk eeeeeeeeeeeeeeIIIIIIIIIIDDDDDDDDDDDDD        
                                                                                                                              
   tFakeID made by TrapZed#1725

   https://github.com/trapzed
   
   🛠️ tDev : https://discord.gg/WEP4CuuQzd
]]--


Config = {}

-- Pour les bases California, mettez la valeur : ::{korioz#0110}:: devant les triggers exemple : 
--Config.events = {
--    ["esx:getSharedObject"] = "::{korioz#0110}::esx:getSharedObject",
--}

Config.Events = {
    ["esx:getSharedObject"] = "esx:getSharedObject",
    ["esx:showNotification"] = "esx:showNotification"
}

-- Prix pour modifier son prénom
Config.PriceFirstname = 20000

-- Prix pour modifier son nom
Config.PriceLastname = 25000

-- Ped
Config.Ped = "ig_dale"

-- Nom de ped
Config.PedName = "Bernardo"

--Position du ped
Config.Position = vector3(-457.9917, -2266.17, 7.53)

-- Heading du ped
Config.Heading = 272.64