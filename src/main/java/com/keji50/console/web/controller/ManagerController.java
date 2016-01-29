/**
 * TestController.java
 * com.keji50.k5.web.controller
 *
 * Function： TODO 
 *
 *   ver     date      		author
 * ──────────────────────────────────
 *   		 2015年12月11日 		chao.li
 *
 * Copyright (c) 2015, Howbuy Rights Reserved.
*/

package com.keji50.console.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * ClassName:TestController
 * Function: TODO ADD FUNCTION
 * Reason:	 TODO ADD REASON
 *
 * @author   chao.li
 * @version  
 * @since    Ver 1.1
 * @Date	 2015年12月11日		下午3:03:25
 *
 * @see 	 
 */
@Controller
@RequestMapping("/manager")
public class ManagerController {
    
    @RequestMapping("/index")
    public String index() {
        return "manager/index";
    }
}

