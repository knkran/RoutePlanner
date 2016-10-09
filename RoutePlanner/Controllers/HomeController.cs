using RoutePlanner.HttpHelper;
using RoutePlanner.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
namespace RoutePlanner.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult CreateMap(string createMapName)
        {
            return RedirectToAction("AddNodesToMap", new RoutePlannerMap(createMapName));
        }

        public ActionResult AddNodesToMap(RoutePlannerMap map)
        {
            return View(map);
        }
    }
}