﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MusicPlayer.Controllers
{
    public class MusicController : Controller
    {
        //
        // GET: /Music/

        public ActionResult Index()
        {
            return View();
        }

    }
}