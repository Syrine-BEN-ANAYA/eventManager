package entities;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.Entity;

@Entity
public class Evenement {
	@Id @GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private String nom;
	private String lieu;
	
	@ManyToOne
	private Organisateur organisateur;

	@ManyToMany(mappedBy = "evenements")
	 Set<Participant> participants = new HashSet<Participant>();
	
	public Set<Participant> getParticipants() {
	    return participants;
	}

	public void setParticipants(Set<Participant> participants) {
	    this.participants = participants;
	}

	
	public String getOrganisateurNom() {
	    return organisateur != null ? organisateur.getNom() : "Inconnu";
	}	public Organisateur getOrganisateur() {
		return organisateur;
	}


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
	public String getLieu() {
		return lieu;
	}
	public void setLieu(String lieu) {
		this.lieu = lieu;
	}
	public Evenement(int id, String nom, String lieu) {
		super();
		this.id = id;
		this.nom = nom;
		this.lieu = lieu;
	}
	public Evenement() {
		super();
	}
	@Override
	public String toString() {
		return "Evenement [id=" + id + ", nom=" + nom + ", lieu=" + lieu + ", organisateur=" + organisateur + "]";
	}
	public void setOrganisateur(Organisateur organisateur) {
        this.organisateur = organisateur;
    }
	
	
	
	

}
