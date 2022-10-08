﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using VenadoProject.Models;
using VenadoProject.Models.ViewModels;

namespace VenadoProject.Filters
{
    [AttributeUsage(AttributeTargets.Method,AllowMultiple=false)]
    public class AuthorizeUser : AuthorizeAttribute
    {
        private usuario oUsuario;
        private pruebaEntities db = new pruebaEntities();
        private int rol;

        public AuthorizeUser(int idrol = 0)
        {
            this.rol = idrol;
        }

        public override void OnAuthorization(AuthorizationContext filterContext)
        {
            try
            {
                oUsuario = (usuario)HttpContext.Current.Session["User"];
                if (oUsuario.tipo != rol){
                    filterContext.Result = new RedirectResult("~/Error/NoAutorizado");
                }

            }
            catch
            {
                filterContext.Result = new RedirectResult("~/Error/NoAutorizado");
            }

        }

    }
}