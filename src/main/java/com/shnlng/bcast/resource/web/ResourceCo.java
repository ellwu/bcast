package com.shnlng.bcast.resource.web;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.support.RequestContext;

import com.shnlng.bcast.base.util.FileUtil;
import com.shnlng.bcast.base.util.IdGen;
import com.shnlng.bcast.resource.domain.ResourceRepo;
import com.shnlng.bcast.resource.domain.entity.ResourceEo;
import com.shnlng.bcast.system.domain.ProfileRepo;

@Controller
@RequestMapping("/resource")
public class ResourceCo {

	private static final Logger logger = Logger.getLogger(ResourceCo.class);

	@Autowired
	private ResourceRepo resourceRepo;
	@Autowired
	private ProfileRepo profileRepo;

	@RequestMapping("/home")
	public String home(HttpServletRequest req, HttpServletResponse resp, Model model) {
		logger.debug("enter home");

		logger.debug("enter home");
		return "/resource/home";
	}

	@RequestMapping("/createResource")
	public String createResource(HttpServletRequest req, HttpServletResponse resp) {
		logger.debug("enter createResource");

		logger.debug("enter createResource");
		return "/resource/createResource";
	}

	@RequestMapping("/editResource")
	public String editResource(HttpServletRequest req, HttpServletResponse resp) {
		logger.debug("enter editResource");

		logger.debug("enter editResource");
		return "/resource/editResource";
	}

	@RequestMapping("/list")
	@ResponseBody
	public Page<ResourceEo> list(Pageable pageable) {
		logger.debug("enter list");

		Page<ResourceEo> result = resourceRepo.findAllActive(pageable);

		logger.debug("leave list");
		return result;
	}

	@RequestMapping("/delete")
	@ResponseBody
	public Map<String, Object> delete(HttpServletRequest req, HttpServletResponse resp, ResourceEo resource) {
		logger.debug("enter delete resource");

		Map<String, Object> result = new HashMap<String, Object>();

		RequestContext requestContext = new RequestContext(req);

		if (resource == null || resource.getId() == null) {
			logger.debug("resource input empty");

			result.put("msg", requestContext.getMessage("resource.delete.error"));
			result.put("status", false);
			return result;
		}

		try {

			resourceRepo.deleteAndDisable(resource.getId());

		} catch (Exception e) {
			logger.error(e.getMessage());

			result.put("msg", requestContext.getMessage("resource.delete.error"));
			result.put("status", false);
			return result;
		}
		result.put("msg", requestContext.getMessage("resource.delete.ok"));
		result.put("status", true);

		logger.debug("enter delete resource");
		return result;
	}

	@RequestMapping("/createResourceAndFile")
	@ResponseBody
	public Map<String, Object> createResourceAndFile(@RequestParam(value = "file", required = false) MultipartFile file,
			ResourceEo resource, HttpServletRequest req, HttpServletResponse resp) {
		logger.debug("enter createResourceAndFile");

		Map<String, Object> result = new HashMap<String, Object>();

		RequestContext requestContext = new RequestContext(req);

		if (file == null) {
			logger.debug("resource file empty");

			result.put("msg", requestContext.getMessage("resource.create.error"));
			result.put("status", false);
			return result;
		}

		if (resource == null) {
			logger.debug("resource input empty");

			result.put("msg", requestContext.getMessage("resource.create.error"));
			result.put("status", false);
			return result;
		}

		String resourceId = IdGen.id32();

		String resourceRepoPath = profileRepo.findValueByKey("RESOURCE_REPO_PATH");
		String resourceFileName = resourceRepoPath + File.separator + resourceId;
		File resourceFile = new File(resourceFileName);

		FileOutputStream fos = null;

		try {
			if (!resourceFile.exists()) {
				resourceFile.createNewFile();
			}

			fos = new FileOutputStream(resourceFile);

			FileUtil.copyStream(file.getInputStream(), fos, true);

			fos.close();
		} catch (Exception e) {
			logger.error(e.getMessage());

			result.put("msg", requestContext.getMessage("resource.create.error"));
			result.put("status", false);
			return result;
		} finally {
			if (fos != null) {
				try {
					fos.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}

		resource.setId(resourceId);
		resource.setOriginName(file.getOriginalFilename());
		resource.setUploadTime(new Date());

		try {
			resource.setCreationTime(new Date());

			resourceRepo.save(resource);

		} catch (Exception e) {
			logger.error(e.getMessage());

			result.put("msg", requestContext.getMessage("resource.create.error"));
			result.put("status", false);
			return result;
		}

		result.put("msg", requestContext.getMessage("resource.create.ok"));
		result.put("status", true);

		logger.debug("leave createResourceAndFile");
		return result;
	}

	@RequestMapping("/create")
	@ResponseBody
	public Map<String, Object> create(HttpServletRequest req, HttpServletResponse resp, ResourceEo resource) {
		logger.debug("enter create resource");

		Map<String, Object> result = new HashMap<String, Object>();

		RequestContext requestContext = new RequestContext(req);

		if (resource == null) {
			logger.debug("resource input empty");

			result.put("msg", requestContext.getMessage("resource.create.error"));
			result.put("status", false);
			return result;
		}

		resource.setId(IdGen.id32());

		try {
			resource.setCreationTime(new Date());

			resourceRepo.save(resource);

		} catch (Exception e) {
			logger.error(e.getMessage());

			result.put("msg", requestContext.getMessage("resource.create.error"));
			result.put("status", false);
			return result;
		}

		result.put("msg", requestContext.getMessage("resource.create.ok"));
		result.put("status", true);

		logger.debug("leave create resource");
		return result;
	}

	@RequestMapping("/edit")
	@ResponseBody
	public Map<String, Object> edit(HttpServletRequest req, HttpServletResponse resp, ResourceEo resource) {
		logger.debug("enter edit resource");

		Map<String, Object> result = new HashMap<String, Object>();

		RequestContext requestContext = new RequestContext(req);

		if (resource == null || StringUtils.isEmpty(resource.getId())) {
			logger.debug("resource input empty");

			result.put("msg", requestContext.getMessage("resource.edit.error"));
			result.put("status", false);
			return result;
		}

		try {
			resource.setUpdateTime(new Date());

			resourceRepo.save(resource);

		} catch (Exception e) {
			logger.error(e.getMessage());

			result.put("msg", requestContext.getMessage("resource.edit.error"));
			result.put("status", false);
			return result;
		}

		result.put("msg", requestContext.getMessage("resource.edit.ok"));
		result.put("status", true);

		logger.debug("leave edit resource");
		return result;
	}

}
