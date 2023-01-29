package com.ilove.coffee.adminProduct;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.ilove.coffee.product.ProductVO;

import fileuploadUtil.FileDTO;
import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/admin")
@RequiredArgsConstructor
public class AdminProductController {
	
	private final AdminProductServiceImp service;
	private static final Logger logger=LoggerFactory.getLogger(AdminProductController.class);

	//상품관리 페이지
	@GetMapping("/manageProduct")
	public String manageProduct(Model model) {
		
		List<ProductVO> list=service.allProduct();
		model.addAttribute("list", list);
		return "/admin/adminProduct/manageProduct";
	}
	
	//상품등록 페이지
	@GetMapping("/insertProduct")
	public String insertProduct() {
		return "/admin/adminProduct/insertProduct";
	}
	
	//상품등록 + 파일업로드 처리
	@PostMapping("/insertProductProc")
	public ModelAndView insertProductProc(ProductVO vo, MultipartFile[] uploadFile) throws IllegalStateException, IOException {
		
		List<FileDTO> list = new ArrayList<>();
		for(MultipartFile file : uploadFile) {
			if(!file.isEmpty()) {
				//uuid를 이용해 unique한 파일이름을 만든다.(동일이름 파일 중복 충돌때문)
				//실제 저장되는 파일이름은 uuid_fileName의 형태
				FileDTO dto = new FileDTO(UUID.randomUUID().toString(),
						file.getOriginalFilename(),file.getContentType());
				list.add(dto);
				
				File newFileName= new File(dto.getUuid()+"_"+dto.getFileName());
				
				//실제저장처리
				file.transferTo(newFileName);
				
				vo.setImageURL(dto.getUuid()+"_"+dto.getFileName());
			}
		}
		
		ModelAndView mav = new ModelAndView();
		int cnt=service.insertProduct(vo);
		
		String msg="";
		String url="";
		if(cnt>0) {
			msg="상품이 등록되었습니다.";
			url="/admin/manageProduct";
		}else {
			msg="상품 등록 실패!";
			url="/admin/insertProduct";
		}
		
		mav.addObject("msg", msg);
		mav.addObject("url", url);
		mav.setViewName("/common/message");
		
		return mav;
	}

}
