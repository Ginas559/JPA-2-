package vn.iotstar.entity;

import java.io.Serializable;

import jakarta.persistence.*;

import java.util.List;

@Entity
@Table(name = "categories") //ten nay se duoc xuat hien trong bang cua database
@NamedQuery(name = "Category.findAll", query = "SELECT c FROM Category c") //hien thi no len
public class Category implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "CategoryId")
    private int categoryId;

    @Column(name = "Categoryname", columnDefinition = "nvarchar(200) not null")
    private String categoryname;

    @Column(name = "Images", columnDefinition = "nvarchar(200) null")
    private String images;

    @Column(name = "Status")
    private int status;

    // Bi-directional one-to-many association to Video
    @OneToMany(mappedBy = "category")
    private List<Video> videos;

	public Category() {
	}

	public int getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}

	public String getCategoryname() {
		return categoryname;
	}

	public void setCategoryname(String categoryname) {
		this.categoryname = categoryname;
	}

	public String getImages() {
		return images;
	}

	public void setImages(String images) {
		this.images = images;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public List<Video> getVideos() {
		return videos;
	}

	public void setVideos(List<Video> videos) {
		this.videos = videos;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

    public Video addVideo(Video video) {
    	getVideos().add(video);
    	video.setCategory(this);
    	
    	return video;
    }
    
    public Video removeVideo(Video video) {
    	getVideos().remove(video);
    	video.setCategory(null);
    	
    	return video;
    }
}
