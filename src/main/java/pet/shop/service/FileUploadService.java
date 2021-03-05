package pet.shop.service;

import org.springframework.web.multipart.MultipartFile;

import pet.shop.domain.Product;





public interface FileUploadService {
	
	String saveStore(MultipartFile file,Product product);
	boolean writeFile(MultipartFile file, String saveFileName);
}
