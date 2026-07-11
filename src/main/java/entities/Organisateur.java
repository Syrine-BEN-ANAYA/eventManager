package entities;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
public class Organisateur {
@Id @GeneratedValue(strategy = GenerationType.IDENTITY)
private int id;
private String nom;


 @OneToMany(mappedBy = "organisateur",cascade = CascadeType.ALL)
private List<Evenement> evenements;
public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}
public String getNom() {
	return nom;
}
public void setNom(String nom) {
	this.nom = nom;
}

public List<Evenement> getEvenements() {
	return evenements;
}
public void setEvenements(List<Evenement> evenements) {
    this.evenements = evenements;
}
@Override
public String toString() {
	return "Organisateur [id=" + id + ", nom=" + nom + ", evenements=" + evenements + "]";
}




}
