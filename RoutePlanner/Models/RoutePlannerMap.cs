using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace RoutePlanner.Models
{
    public class RoutePlannerMap
    {
        public string Name { get; set; }

        public RoutePlannerMap(String name)
        {
            this.Name = name;
        }

        public RoutePlannerMap()
        {

        }

        public static RoutePlannerMap initMap(RoutePlanner.Models.Map map)
        {
            return new RoutePlannerMap(map.name);
        }
    }
}