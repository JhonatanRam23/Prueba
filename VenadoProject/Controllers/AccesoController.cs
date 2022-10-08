﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace VenadoProject.Controllers
{
    public class AccesoController : Controller
    {
        // GET: Acceso
        public ActionResult Login()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Login(string User,string pass)
        {
            try
            {
                using (Models.ViewModels.pruebaEntities db= new Models.ViewModels.pruebaEntities())
                {
                    var oUser = (from d in db.usuario
                                 where d.email_usuario== User.Trim() && d.contraseña == pass.Trim()
                                 select d).FirstOrDefault();
                    if (oUser == null)
                    {
                        ViewBag.Error = "Usuario o Contraseña Invalido";
                        return View();
                    }
                    Session["User"] = oUser;
                }
                return RedirectToAction("Index", "Home");
            }
            catch(Exception ex)
            {
                ViewBag.Error = ex.Message;
                return View();
            }
        }

    }
}