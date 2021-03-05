package pet.shop.service;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;


import lombok.extern.log4j.Log4j;
import pet.shop.fileSetting.path;
import pet.shop.mapper.CartMapper;
import pet.shop.mapper.ProductMapper;
import pet.shop.domain.Product;
import pet.shop.domain.Product_pic;


@Log4j
@Service("FileUploadServiceImpl")
public class FileUploadServiceImpl implements FileUploadService {

	@Autowired
	CartMapper cartMapper;
	@Autowired
	ProductMapper productMapper;
	
	@Override
	public String saveStore(MultipartFile file,Product product) {
		log.info("파일 saveStore 까지옴 ");
		String product_ofname = file.getOriginalFilename();
		int idx = product_ofname.lastIndexOf(".");
		String ofheader = product_ofname.substring(0, idx);
		String ext = product_ofname.substring(idx);
		long ms = System.currentTimeMillis();
		StringBuilder sb = new StringBuilder();
		sb.append(ofheader);
		sb.append("_");
		sb.append(ms);
		sb.append(ext);
		String product_fname = sb.toString();
		long product_fsize = file.getSize();
		log.info("#ofname: "+product_ofname+", saveFileName: "+ product_fname+", fsize: "+product_fsize);
		boolean flag = writeFile(file, product_fname);
		if(flag) {
			log.info("#업로드 성공");
		}else{
			log.info("#업로드 실패");
		}
		//업로드 성공후에 image에 넣을 product_fname을 product_image로 주입
		product.setProduct_image(product_fname);
		//이후에 insert문에 값을 넣어서 데이터 뽑아내기.
		productMapper.insert(product);
		return path.FILE_STORE +product_fname;
	}
	@Override
	public boolean writeFile(MultipartFile file, String saveFileName) {
		File rDir = new File(path.FILE_STORE);
		if(!rDir.exists()) rDir.mkdirs();
		
		FileOutputStream fos = null;
		try {
			byte data[] = file.getBytes();
			fos = new FileOutputStream(path.FILE_STORE+saveFileName);
			fos.write(data);
			fos.flush();
			
			return true;
		}catch(IOException ie) {
			return false;
		}finally {
			try {
				if(fos != null) fos.close();
			}catch(IOException ie) {}
		}
	}
	

	
	

}
