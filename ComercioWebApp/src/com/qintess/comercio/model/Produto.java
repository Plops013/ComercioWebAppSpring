package com.qintess.comercio.model;

import java.io.UnsupportedEncodingException;
import java.math.BigDecimal;
import java.util.Base64;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;


@Entity
@Table(name = "produtos")
public class Produto {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@Column(nullable = false)
	private String nome;
	
	@Column(nullable = false, name = "valor_unitario")
	private BigDecimal valorUnitario;

	@Transient
	private String imagemEncoded;
	
	public String getImagemEncoded() {
		try {
			String base64Encoded;
			byte[] encodeBase64 = Base64.getEncoder().encode(this.imagemProd);
			base64Encoded = new String(encodeBase64, "UTF-8");
			this.imagemEncoded = base64Encoded;
			return imagemEncoded;
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
			return null;
		}
	}

	private byte[] imagemProd;
	
	public byte[] getImagemProd() {
		return imagemProd;
	}

	public void setImagemProd(byte[] imagemProd) {
		this.imagemProd = imagemProd;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public BigDecimal getValorUnitario() {
		return valorUnitario;
	}

	public void setValorUnitario(BigDecimal valorUnitario) {
		this.valorUnitario = valorUnitario;
	}

	@Override
	public String toString() {
		return "Produto [id=" + id + ", nome=" + nome + ", valorUnitario=" + valorUnitario + "]";
	}

}
