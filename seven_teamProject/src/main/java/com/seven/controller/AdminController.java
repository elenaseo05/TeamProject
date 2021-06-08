package com.seven.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.seven.domain.MemberBean;
import com.seven.domain.PageBean;
import com.seven.domain.ProductBean;
import com.seven.service.MemberService;
import com.seven.service.ProductService;

@Controller
public class AdminController {
	
	@Inject
	private ProductService productService;
	@Inject
	private MemberService memberService;
	@Resource(name = "uploadPath")
	private String uploadPath;
	
	@RequestMapping(value = "/admin/main", method = RequestMethod.GET)
	public String main(HttpServletRequest request, Model model) {
		return "admin/main";
	}
	
	//		● 상품관리 시작 ↓↓
	@RequestMapping(value = "/admin/manageProduct", method = RequestMethod.GET)
	public String price(HttpServletRequest request,Model model) {	
		PageBean pb=new PageBean();
		
		if(request.getParameter("category1")!=null) {
			System.out.println(request.getParameter("category1"));
			
			pb.setCategory(request.getParameter("category1"));
			
			if(request.getParameter("pageNum")!=null) {
				
				pb.setPageNum(request.getParameter("pageNum"));
			}else {
			pb.setPageNum("1");
			}
			pb.setPageSize(12);
					
			List<ProductBean> productList=productService.getCategoryList(pb);
			
			
			pb.setCount(productService.getProductCount());
			
			model.addAttribute("productList",productList);
			model.addAttribute("pb",pb);
			return "/admin/manageProduct";
			}
			

		if(request.getParameter("lower")!=null&&request.getParameter("upper")!=null) {
		System.out.println(request.getParameter("lower"));
		System.out.println(request.getParameter("upper"));
			
		pb.setLower(Float.parseFloat(request.getParameter("lower")));
		pb.setUpper(Float.parseFloat(request.getParameter("upper")));
		
		if(request.getParameter("pageNum")!=null) {
			
			pb.setPageNum(request.getParameter("pageNum"));
		}else {
		pb.setPageNum("1");
		}
		pb.setPageSize(12);
				
		List<ProductBean> productList=productService.getPriceList(pb);
		
		
		pb.setCount(productService.getProductCount());
		
		System.out.println(pb.getLower());
		System.out.println(pb.getUpper());
		
		model.addAttribute("productList",productList);
		model.addAttribute("pb",pb);
		return "/admin/manageProduct";
		}
		
		if(request.getParameter("sorting")!=null) {
			System.out.println(request.getParameter("sorting"));
			
		if(request.getParameter("sorting").equals("low-high")) {
			pb.setSorting(request.getParameter("sorting"));
			
			if(request.getParameter("pageNum")!=null) {
				
				pb.setPageNum(request.getParameter("pageNum"));
			}else {
				
				pb.setPageNum("1");
			}
			pb.setPageSize(12);
					
			List<ProductBean> productList=productService.getLowList(pb);
			
			
			pb.setCount(productService.getProductCount());
			
			model.addAttribute("productList",productList);
			model.addAttribute("pb",pb);	
			return "product/shop";
			
			
		}else if(request.getParameter("sorting").equals("high-low")) {
			pb.setSorting(request.getParameter("sorting"));
			
			if(request.getParameter("pageNum")!=null) {
				
				pb.setPageNum(request.getParameter("pageNum"));
			}else {
				
				pb.setPageNum("1");
			}
			pb.setPageSize(12);
					
			List<ProductBean> productList=productService.getHighList(pb);
			
			
			pb.setCount(productService.getProductCount());
			
			model.addAttribute("productList",productList);
			model.addAttribute("pb",pb);
			return "/admin/manageProduct";
		
		}
			
		}
			
		
		
		if(request.getParameter("pageNum")!=null) {
				
				pb.setPageNum(request.getParameter("pageNum"));
			}else {
				
				pb.setPageNum("1");
			}
			pb.setPageSize(12);
			
			List<ProductBean> productList=productService.getProductList(pb);
			
			
			pb.setCount(productService.getProductCount());
			
			model.addAttribute("productList",productList);
			model.addAttribute("pb",pb);
		
		
		
		return "/admin/manageProduct";
		
		
		
	}
	
	
	//		●상품등록 시작 ↓↓
	@RequestMapping(value = "/admin/insertProduct", method = RequestMethod.GET)
	public String insertProduct() {
		return "admin/insertProductForm";
	}
	
	
	@RequestMapping(value = "/admin/insertProductPro", method = RequestMethod.POST)
	public String insertProductPro(HttpServletRequest request, 
			@RequestParam(value = "product_image", required = false) MultipartFile  file, 
			@RequestParam(value = "product_detail_img1", required = false) MultipartFile  file1,
			@RequestParam(value = "product_detail_img2", required = false) MultipartFile  file2,
			@RequestParam(value = "product_detail_img3", required = false) MultipartFile  file3,
			@RequestParam(value = "product_detail_img4", required = false) MultipartFile  file4) throws Exception {
		
		// ↓ java.util 랜덤문자열 생성기 : 랜덤문자열_파일명 형태로 saveName에 저장 (파일명 중복방지)
		UUID uid = UUID.randomUUID();
		String saveName = uid.toString() + "_" + file.getOriginalFilename();
		String saveName1 = uid.toString() + "_" + file1.getOriginalFilename();
		String saveName2 = uid.toString() + "_" + file2.getOriginalFilename();
		String saveName3 = uid.toString() + "_" + file3.getOriginalFilename();
		String saveName4 = uid.toString() + "_" + file4.getOriginalFilename();
		
		File target = new File(uploadPath, saveName);
		File target1 = new File(uploadPath, saveName1);
		File target2 = new File(uploadPath, saveName2);
		File target3 = new File(uploadPath, saveName3);
		File target4 = new File(uploadPath, saveName4);
		
		try {
			
			FileCopyUtils.copy(file.getBytes(), target);
			FileCopyUtils.copy(file1.getBytes(), target1);
			FileCopyUtils.copy(file2.getBytes(), target2);
			FileCopyUtils.copy(file3.getBytes(), target3);
			FileCopyUtils.copy(file4.getBytes(), target4);
			
		} catch (IOException e) {
			
			e.printStackTrace();
			
		}
		
		ProductBean productBean = new ProductBean();
		productBean.setProduct_title(request.getParameter("product_title"));
		productBean.setProduct_price(Float.parseFloat(request.getParameter("product_price")));
		productBean.setProduct_image(saveName);
		productBean.setProduct_color(request.getParameter("product_color"));
		productBean.setProduct_size(request.getParameter("product_size"));
		productBean.setProduct_stock(Integer.parseInt(request.getParameter("product_stock")));
		productBean.setProduct_category(request.getParameter("product_category"));
		productBean.setProduct_detail_text(request.getParameter("product_detail_text"));
		productBean.setProduct_detail_img1(saveName1);
		productBean.setProduct_detail_img2(saveName2);
		productBean.setProduct_detail_img3(saveName3);
		productBean.setProduct_detail_img4(saveName4);
		productBean.setProduct_detail_del_info(request.getParameter("product_detail_del_info"));
		productBean.setProduct_detail_sale(request.getParameter("product_detail_sale"));
		productBean.setProduct_detail_admin_note(request.getParameter("product_detail_admin_note"));
		
		productService.insertProduct(productBean);
		return "redirect:/product/shop";
		
	}
	//		●상품등록 끝 ↑↑
	
	
	//		●상품수정 시작 ↓↓
	@RequestMapping(value = "/admin/updateProduct", method = RequestMethod.GET)
	public String updateProduct(HttpServletRequest request, Model model) {
		
		int product_num = Integer.parseInt(request.getParameter("product_num"));
		ProductBean productBean = productService.getProduct(product_num);
		model.addAttribute("productBean", productBean);
		return "admin/updateProductForm";
		
	}
	
	@RequestMapping(value = "/admin/updateProductPro", method = RequestMethod.POST)
	public String updateProductPro (HttpServletRequest request, 
			@RequestParam(value = "product_image", required = false) MultipartFile  file, 
			@RequestParam(value = "product_detail_img1", required = false) MultipartFile  file1,
			@RequestParam(value = "product_detail_img2", required = false) MultipartFile  file2,
			@RequestParam(value = "product_detail_img3", required = false) MultipartFile  file3,
			@RequestParam(value = "product_detail_img4", required = false) MultipartFile  file4) throws Exception {
		
		UUID uid = UUID.randomUUID();
		
		String saveName = "";
		String saveName1 = "";
		String saveName2 = "";
		String saveName3 = "";
		String saveName4 = "";
		
		if(file.isEmpty() == true) {
			saveName = request.getParameter("existing_product_image");
		} else {
			saveName = uid.toString() + "_" + file.getOriginalFilename();
			File target = new File(uploadPath, saveName);
			FileCopyUtils.copy(file.getBytes(), target);			
		}
		
		if(file1.isEmpty() == true) {
			saveName1 = request.getParameter("existing_product_detail_img1");
		} else {
			saveName1 = uid.toString() + "_" + file1.getOriginalFilename();
			File target1 = new File(uploadPath, saveName1);
			FileCopyUtils.copy(file1.getBytes(), target1);			
		}
		
		if(file2.isEmpty() == true) {
			saveName2 = request.getParameter("existing_product_detail_img2");
		} else {
			saveName2 = uid.toString() + "_" + file2.getOriginalFilename();
			File target2 = new File(uploadPath, saveName2);
			FileCopyUtils.copy(file2.getBytes(), target2);			
		}
		
		if(file3.isEmpty() == true) {
			saveName3 = request.getParameter("existing_product_detail_img3");
		} else {
			saveName3 = uid.toString() + "_" + file3.getOriginalFilename();
			File target3 = new File(uploadPath, saveName3);
			FileCopyUtils.copy(file3.getBytes(), target3);			
		}
		
		if(file4.isEmpty() == true) {
			saveName4 = request.getParameter("existing_product_detail_img4");
		} else {
			saveName4 = uid.toString() + "_" + file4.getOriginalFilename();
			File target4 = new File(uploadPath, saveName4);
			FileCopyUtils.copy(file4.getBytes(), target4);			
		}

		
		ProductBean productBean = new ProductBean();
		productBean.setProduct_num(Integer.parseInt(request.getParameter("product_num")));
		productBean.setProduct_title(request.getParameter("product_title"));
		productBean.setProduct_price(Float.parseFloat(request.getParameter("product_price")));
		productBean.setProduct_image(saveName);
		productBean.setProduct_color(request.getParameter("product_color"));
		productBean.setProduct_size(request.getParameter("product_size"));
		productBean.setProduct_stock(Integer.parseInt(request.getParameter("product_stock")));
		productBean.setProduct_category(request.getParameter("product_category"));
		productBean.setProduct_detail_text(request.getParameter("product_detail_text"));
		productBean.setProduct_detail_img1(saveName1);
		productBean.setProduct_detail_img2(saveName2);
		productBean.setProduct_detail_img3(saveName3);
		productBean.setProduct_detail_img4(saveName4);
		productBean.setProduct_detail_del_info(request.getParameter("product_detail_del_info"));
		productBean.setProduct_detail_sale(request.getParameter("product_detail_sale"));
		productBean.setProduct_detail_admin_note(request.getParameter("product_detail_admin_note"));
		
		productService.updateProduct(productBean);
		return "redirect:/product/shop";
		
	}
	//		●상품수정 끝 ↑↑
	
	
	//		●상품삭제 시작 ↓↓
	@RequestMapping(value = "/admin/deleteProduct", method = RequestMethod.GET)
	public String deleteProduct(HttpServletRequest request, Model model) {
		
		int product_num = Integer.parseInt(request.getParameter("product_num"));
		ProductBean productBean = productService.getProduct(product_num);
		System.out.println(productBean.getProduct_num());
		model.addAttribute("productBean", productBean);
		return "admin/deleteProductForm";
		
	}
	
	
	@RequestMapping(value = "/admin/deleteProductPro", method = RequestMethod.POST)
	public String deleteProductpro(MemberBean mb, ProductBean productBean, Model model) {
		
		MemberBean mb2 = memberService.userCheck(mb);
		
		if(mb2 != null) {
			productService.deleteProduct(productBean);
			return "redirect:/product/shop";
		}else {
			model.addAttribute("error", "입력하신 정보가 일치하지 않습니다");
			return "member/error";
		}
		
	}
	
	//		●회원정보 조회 시작 ↓↓
	@RequestMapping(value = "/admin/selectMember", method = RequestMethod.GET)
	public String selectMemberTable(HttpServletRequest request, Model model) {
		
		PageBean pb = new PageBean();
		if(request.getParameter("PageNum") != null) {
			pb.setPageNum(request.getParameter("pageNum"));
		}else {
			pb.setPageNum("1");
		}
		pb.setPageSize(10);
		
		List<MemberBean> memberList = memberService.getMemberList();
		model.addAttribute("memberList", memberList);
		model.addAttribute("pb", pb);
		
		return "admin/selectMemberTable";
	}
	
	@RequestMapping(value = "/admin/selectProduct", method = RequestMethod.GET)
	public String selectProductTable() {
		return "admin/selectProductTable";
	}

}
