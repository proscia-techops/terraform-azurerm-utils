locals {
  # Azure region API codes to Display Names
  api_to_display = {
    "australiacentral"   = "Australia Central"
    "australiacentral2"  = "Australia Central 2" 
    "australiaeast"      = "Australia East"
    "australiasoutheast" = "Australia Southeast"
    "brazilsouth"        = "Brazil South"
    "brazilsoutheast"    = "Brazil Southeast"
    "canadacentral"      = "Canada Central"
    "canadaeast"         = "Canada East"
    "centralindia"       = "Central India"
    "centralus"          = "Central US"
    "centraluseuap"      = "Central US EUAP"
    "eastasia"           = "East Asia"
    "eastus"             = "East US"
    "eastus2"            = "East US 2"
    "eastus2euap"        = "East US 2 EUAP"
    "francecentral"      = "France Central"
    "francesouth"        = "France South"
    "germanynorth"       = "Germany North"
    "germanywestcentral" = "Germany West Central"
    "israelcentral"      = "Israel Central"
    "italynorth"         = "Italy North"
    "japaneast"          = "Japan East"
    "japanwest"          = "Japan West"
    "jioindiacentral"    = "Jio India Central"
    "jioindiawest"       = "Jio India West"
    "koreacentral"       = "Korea Central"
    "koreasouth"         = "Korea South"
    "northcentralus"     = "North Central US"
    "northeurope"        = "North Europe"
    "norwayeast"         = "Norway East"
    "norwaywest"         = "Norway West"
    "polandcentral"      = "Poland Central"
    "qatarcentral"       = "Qatar Central"
    "southafricanorth"   = "South Africa North"
    "southafricawest"    = "South Africa West"
    "southcentralus"     = "South Central US"
    "southeastasia"      = "Southeast Asia"
    "southindia"         = "South India"
    "spaincentral"       = "Spain Central"
    "swedencentral"      = "Sweden Central"
    "swedensouth"        = "Sweden South"
    "switzerlandnorth"   = "Switzerland North"
    "switzerlandwest"    = "Switzerland West"
    "uaecentral"         = "UAE Central"
    "uaenorth"           = "UAE North"
    "uksouth"            = "UK South"
    "ukwest"             = "UK West"
    "westcentralus"      = "West Central US"
    "westeurope"         = "West Europe"
    "westindia"          = "West India"
    "westus"             = "West US"
    "westus2"            = "West US 2"
    "westus3"            = "West US 3"
  }

  # Azure region API codes to Fixed codes (3 chars, 4 chars with AZ)
  # Regional prefixes: u/us=USA, c/ca=Canada, e/eu=Europe, a/as=Asia, s/sa=SouthAmerica, f/af=Africa, m/me=MiddleEast, o/oc=Oceania, n/no=Nordic
  api_to_fixed = {
    # USA regions (u prefix)
    "centralus"      = "uc1"  # u=usa, c=central, 1=primary
    "eastus"         = "ue1"  # u=usa, e=east, 1=primary
    "eastus2"        = "ue2"  # u=usa, e=east, 2=secondary
    "eastus2euap"    = "ue3"  # u=usa, e=east, 3=euap
    "centraluseuap"  = "uc2"  # u=usa, c=central, 2=euap
    "northcentralus" = "un1"  # u=usa, n=north-central, 1=primary
    "southcentralus" = "us1"  # u=usa, s=south-central, 1=primary
    "westcentralus"  = "uw1"  # u=usa, w=west-central, 1=primary
    "westus"         = "uw2"  # u=usa, w=west, 2=primary
    "westus2"        = "uw3"  # u=usa, w=west, 3=secondary
    "westus3"        = "uw4"  # u=usa, w=west, 4=tertiary

    # Canada regions (c prefix)
    "canadacentral"  = "cc1"  # c=canada, c=central, 1=primary
    "canadaeast"     = "ce1"  # c=canada, e=east, 1=primary

    # Europe regions (e prefix)
    "northeurope"        = "en1"  # e=europe, n=north, 1=primary
    "westeurope"         = "ew1"  # e=europe, w=west, 1=primary
    "francecentral"      = "ef1"  # e=europe, f=france, 1=primary
    "francesouth"        = "ef2"  # e=europe, f=france, 2=south
    "germanynorth"       = "eg1"  # e=europe, g=germany, 1=north
    "germanywestcentral" = "eg2"  # e=europe, g=germany, 2=west-central
    "italynorth"         = "ei1"  # e=europe, i=italy, 1=north
    "norwayeast"         = "eo1"  # e=europe, o=norway, 1=east
    "norwaywest"         = "eo2"  # e=europe, o=norway, 2=west
    "polandcentral"      = "ep1"  # e=europe, p=poland, 1=central
    "spaincentral"       = "es1"  # e=europe, s=spain, 1=central
    "swedencentral"      = "es2"  # e=europe, s=sweden, 1=central (s2 to avoid conflict)
    "swedensouth"        = "es3"  # e=europe, s=sweden, 2=south
    "switzerlandnorth"   = "ez1"  # e=europe, z=switzerland, 1=north
    "switzerlandwest"    = "ez2"  # e=europe, z=switzerland, 2=west
    "uksouth"            = "ek1"  # e=europe, k=uk, 1=south
    "ukwest"             = "ek2"  # e=europe, k=uk, 2=west

    # Asia regions (a prefix)
    "eastasia"         = "ae1"  # a=asia, e=east, 1=primary
    "southeastasia"    = "as1"  # a=asia, s=southeast, 1=primary
    "centralindia"     = "ai1"  # a=asia, i=india, 1=central
    "southindia"       = "ai2"  # a=asia, i=india, 2=south
    "westindia"        = "ai3"  # a=asia, i=india, 3=west
    "jioindiacentral"  = "aj1"  # a=asia, j=jio-india, 1=central
    "jioindiawest"     = "aj2"  # a=asia, j=jio-india, 2=west
    "japaneast"        = "ap1"  # a=asia, p=japan, 1=east
    "japanwest"        = "ap2"  # a=asia, p=japan, 2=west
    "koreacentral"     = "ak1"  # a=asia, k=korea, 1=central
    "koreasouth"       = "ak2"  # a=asia, k=korea, 2=south

    # South America regions (s prefix)
    "brazilsouth"      = "sb1"  # s=south-america, b=brazil, 1=south
    "brazilsoutheast"  = "sb2"  # s=south-america, b=brazil, 2=southeast

    # Africa regions (f prefix)
    "southafricanorth" = "fa1"  # f=africa, a=south-africa, 1=north
    "southafricawest"  = "fa2"  # f=africa, a=south-africa, 2=west

    # Middle East regions (m prefix)
    "israelcentral"    = "mi1"  # m=middle-east, i=israel, 1=central
    "qatarcentral"     = "mq1"  # m=middle-east, q=qatar, 1=central
    "uaecentral"       = "mu1"  # m=middle-east, u=uae, 1=central
    "uaenorth"         = "mu2"  # m=middle-east, u=uae, 2=north

    # Oceania regions (o prefix)
    "australiacentral"   = "oc1"  # o=oceania, c=australia-central, 1=primary
    "australiacentral2"  = "oc2"  # o=oceania, c=australia-central, 2=secondary
    "australiaeast"      = "oe1"  # o=oceania, e=australia-east, 1=primary
    "australiasoutheast" = "os1"  # o=oceania, s=australia-southeast, 1=primary
  }

  # Azure region API codes to Short codes (4 chars, 5 chars with AZ)
  # Similar pattern but slightly longer for better readability
  api_to_short = {
    # USA regions (us prefix)
    "centralus"      = "usc1"  # us=usa, c=central, 1=primary
    "eastus"         = "use1"  # us=usa, e=east, 1=primary
    "eastus2"        = "use2"  # us=usa, e=east, 2=secondary
    "eastus2euap"    = "use3"  # us=usa, e=east, 3=euap
    "centraluseuap"  = "usc2"  # us=usa, c=central, 2=euap
    "northcentralus" = "usn1"  # us=usa, n=north-central, 1=primary
    "southcentralus" = "uss1"  # us=usa, s=south-central, 1=primary
    "westcentralus"  = "usw1"  # us=usa, w=west-central, 1=primary
    "westus"         = "usw2"  # us=usa, w=west, 2=primary
    "westus2"        = "usw3"  # us=usa, w=west, 3=secondary
    "westus3"        = "usw4"  # us=usa, w=west, 4=tertiary

    # Canada regions (ca prefix)
    "canadacentral"  = "cac1"  # ca=canada, c=central, 1=primary
    "canadaeast"     = "cae1"  # ca=canada, e=east, 1=primary

    # Europe regions (eu prefix)
    "northeurope"        = "eun1"  # eu=europe, n=north, 1=primary
    "westeurope"         = "euw1"  # eu=europe, w=west, 1=primary
    "francecentral"      = "euf1"  # eu=europe, f=france, 1=primary
    "francesouth"        = "euf2"  # eu=europe, f=france, 2=south
    "germanynorth"       = "eug1"  # eu=europe, g=germany, 1=north
    "germanywestcentral" = "eug2"  # eu=europe, g=germany, 2=west-central
    "italynorth"         = "eui1"  # eu=europe, i=italy, 1=north
    "norwayeast"         = "euo1"  # eu=europe, o=norway, 1=east
    "norwaywest"         = "euo2"  # eu=europe, o=norway, 2=west
    "polandcentral"      = "eup1"  # eu=europe, p=poland, 1=central
    "spaincentral"       = "eus1"  # eu=europe, s=spain, 1=central
    "swedencentral"      = "eus2"  # eu=europe, s=sweden, 1=central (s2 to avoid conflict)
    "swedensouth"        = "eus3"  # eu=europe, s=sweden, 2=south
    "switzerlandnorth"   = "euz1"  # eu=europe, z=switzerland, 1=north
    "switzerlandwest"    = "euz2"  # eu=europe, z=switzerland, 2=west
    "uksouth"            = "euk1"  # eu=europe, k=uk, 1=south
    "ukwest"             = "euk2"  # eu=europe, k=uk, 2=west

    # Asia regions (as prefix)
    "eastasia"         = "ase1"  # as=asia, e=east, 1=primary
    "southeastasia"    = "ass1"  # as=asia, s=southeast, 1=primary
    "centralindia"     = "asi1"  # as=asia, i=india, 1=central
    "southindia"       = "asi2"  # as=asia, i=india, 2=south
    "westindia"        = "asi3"  # as=asia, i=india, 3=west
    "jioindiacentral"  = "asj1"  # as=asia, j=jio-india, 1=central
    "jioindiawest"     = "asj2"  # as=asia, j=jio-india, 2=west
    "japaneast"        = "asp1"  # as=asia, p=japan, 1=east
    "japanwest"        = "asp2"  # as=asia, p=japan, 2=west
    "koreacentral"     = "ask1"  # as=asia, k=korea, 1=central
    "koreasouth"       = "ask2"  # as=asia, k=korea, 2=south

    # South America regions (sa prefix)
    "brazilsouth"      = "sab1"  # sa=south-america, b=brazil, 1=south
    "brazilsoutheast"  = "sab2"  # sa=south-america, b=brazil, 2=southeast

    # Africa regions (af prefix)
    "southafricanorth" = "afa1"  # af=africa, a=south-africa, 1=north
    "southafricawest"  = "afa2"  # af=africa, a=south-africa, 2=west

    # Middle East regions (me prefix)
    "israelcentral"    = "mei1"  # me=middle-east, i=israel, 1=central
    "qatarcentral"     = "meq1"  # me=middle-east, q=qatar, 1=central
    "uaecentral"       = "meu1"  # me=middle-east, u=uae, 1=central
    "uaenorth"         = "meu2"  # me=middle-east, u=uae, 2=north

    # Oceania regions (oc prefix)
    "australiacentral"   = "occ1"  # oc=oceania, c=australia-central, 1=primary
    "australiacentral2"  = "occ2"  # oc=oceania, c=australia-central, 2=secondary
    "australiaeast"      = "oce1"  # oc=oceania, e=australia-east, 1=primary
    "australiasoutheast" = "ocs1"  # oc=oceania, s=australia-southeast, 1=primary
  }

  # Create reverse mappings for all conversions
  display_to_api = zipmap(values(local.api_to_display), keys(local.api_to_display))
  fixed_to_api   = zipmap(values(local.api_to_fixed), keys(local.api_to_fixed))
  short_to_api   = zipmap(values(local.api_to_short), keys(local.api_to_short))

  # Display Name to Fixed/Short mappings
  display_to_fixed = { for api_key, display_name in local.api_to_display : display_name => local.api_to_fixed[api_key] }
  display_to_short = { for api_key, display_name in local.api_to_display : display_name => local.api_to_short[api_key] }

  # Fixed/Short to Display Name mappings  
  fixed_to_display = { for api_key, fixed_code in local.api_to_fixed : fixed_code => local.api_to_display[api_key] }
  short_to_display = { for api_key, short_code in local.api_to_short : short_code => local.api_to_display[api_key] }

  # Complete list of available Azure regions
  regions = sort(keys(local.api_to_display))
}