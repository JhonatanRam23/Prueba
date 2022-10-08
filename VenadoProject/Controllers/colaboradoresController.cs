using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using VenadoProject.Models.ViewModels;

namespace VenadoProject.Controllers
{
    public class colaboradoresController : Controller
    {
        private pruebaEntities db = new pruebaEntities();

        // GET: colaboradores
        public ActionResult Index()
        {
            var colaboradores = db.colaboradores.Include(c => c.departamento);
            return View(colaboradores.ToList());
        }

        // GET: colaboradores/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            colaboradores colaboradores = db.colaboradores.Find(id);
            if (colaboradores == null)
            {
                return HttpNotFound();
            }
            return View(colaboradores);
        }

        // GET: colaboradores/Create
        public ActionResult Create()
        {
            ViewBag.codigo_departamento = new SelectList(db.departamento, "codigo_departamento", "nombre_departamento");
            return View();
        }

        // POST: colaboradores/Create
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que desea enlazarse. Para obtener 
        // más información vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "dpi_colaborador,nombre_colaborador,apellido_colaborador,direccion_colaborador,telefono_colaborador,cantidad_hijos,puesto_colaborador,codigo_departamento,salario_mensual")] colaboradores colaboradores)
        {
            if (ModelState.IsValid)
            {
                db.colaboradores.Add(colaboradores);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.codigo_departamento = new SelectList(db.departamento, "codigo_departamento", "nombre_departamento", colaboradores.codigo_departamento);
            return View(colaboradores);
        }

        // GET: colaboradores/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            colaboradores colaboradores = db.colaboradores.Find(id);
            if (colaboradores == null)
            {
                return HttpNotFound();
            }
            ViewBag.codigo_departamento = new SelectList(db.departamento, "codigo_departamento", "nombre_departamento", colaboradores.codigo_departamento);
            return View(colaboradores);
        }

        // POST: colaboradores/Edit/5
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que desea enlazarse. Para obtener 
        // más información vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "dpi_colaborador,nombre_colaborador,apellido_colaborador,direccion_colaborador,telefono_colaborador,cantidad_hijos,puesto_colaborador,codigo_departamento,salario_mensual")] colaboradores colaboradores)
        {
            if (ModelState.IsValid)
            {
                db.Entry(colaboradores).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.codigo_departamento = new SelectList(db.departamento, "codigo_departamento", "nombre_departamento", colaboradores.codigo_departamento);
            return View(colaboradores);
        }

        // GET: colaboradores/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            colaboradores colaboradores = db.colaboradores.Find(id);
            if (colaboradores == null)
            {
                return HttpNotFound();
            }
            return View(colaboradores);
        }

        // POST: colaboradores/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            colaboradores colaboradores = db.colaboradores.Find(id);
            db.colaboradores.Remove(colaboradores);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
