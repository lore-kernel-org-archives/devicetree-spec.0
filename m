Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27D45653
	for <devicetree-spec@vger.kernel.org>; Sat, 21 Oct 2023 09:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=crashcourse.ca header.i=@crashcourse.ca header.b="PlfXBAj3"
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14F1610F7
	for <devicetree-spec@vger.kernel.org>; Sat, 21 Oct 2023 02:09:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=7OVhp4LcvrQs3MDPPjI/ApQAgDv5RKry6Hu5+rvH9sQ=; b=PlfXBAj36jl5nSpdvOnB54naTp
	XdGPeJQdISqM92j4DyB1r7AnegByPbq8R0aWam0PeSWZkR0QpbdW7WeBy7Kk3OMecWpFG0hDlHrJg
	i9paXXas7uXW/Immb4Bmlj4zf8fjXWHHxhWsFrbhsGveqFei5XvGS4l+R6vIehNo7bXqLr7Gfhb7o
	t6oFjSmqLpw9q6xyQRiNb2P8m+lgklQYJsBkg6s03VEZ42Tvv/dRntsaYxW+tU8PRW9KbuibSSDLy
	TU+KflYfAGf9BtyHODiVauzj47mJap31n/A9mnPrVpulPQZ3vtZVYVcG/dGBhuwuw/vPsWK7BUf7D
	5j0semBg==;
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.102.5]:52152 helo=fedora)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1qu7yZ-009dBV-26;
	Sat, 21 Oct 2023 05:08:57 -0400
Date: Sat, 21 Oct 2023 05:08:48 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: David Gibson <david@gibson.dropbear.id.au>
cc: devicetree spec mailing list <devicetree-spec@vger.kernel.org>
Subject: Re: Definition of "should" seems inconsistent with idea of
 "deprecated"
In-Reply-To: <ZTG8szcUghDU12ZZ@zatzit>
Message-ID: <e86932a-f08b-e23-bf6-d8b7f688ce3@crashcourse.ca>
References: <cddc5065-42d2-11f6-9195-296361c8aef7@crashcourse.ca> <ZTG8szcUghDU12ZZ@zatzit>
Precedence: bulk
X-Mailing-List: devicetree-spec@vger.kernel.org
List-Id: <devicetree-spec.vger.kernel.org>
List-Subscribe: <mailto:devicetree-spec+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-spec+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel10.indieserve.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel10.indieserve.net: authenticated_id: rpjday+crashcourse.ca/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: cpanel10.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 

On Fri, 20 Oct 2023, David Gibson wrote:

> On Thu, Oct 19, 2023 at 07:03:56AM -0400, Robert P. J. Day wrote:
> >
> >   Reading DTSpec v0.4, near the beginning:
> >
> > "The word should is used to indicate that among several possibilities
> > one is recommended as particularly suitable, without mentioning or
> > excluding others; or that a certain course of action is preferred but
> > not necessarily required; or that (in the negative form) a certain
> > course of action is deprecated but not prohibited (should equals is
> > recommended that)."
> >
> >   It seems contradictory to suggest that "should" implies
> > "recommended" but, in the negative sense, it can also support
>
> I believe that by "in the negative form", it means when something says
> "should not"..
>
> > "deprecated", which typically suggests something that is *not*
> > recommended but is nonetheless acceptable.
>
> ..in which case being similar to "deprecated" makes sense.
>
> I will agree that saying "in the negative form", parenthesized,
> amongst a cluster of interacting clauses is probably not a great way
> of expressing this, and it might be clearer to explicitly give a
> meaning to "should not".

  Yes, I see that I misread it somewhat and it's not as bad as I
thought originally, but it definitely would be clearer if the concept
of "should not" was combined with the idea of, say:

  "Should not" means that, even if a particular possibility is
discouraged or deprecated, it is still acceptable as a viable choice.

  Or something like that. "in the negative form" is way too wordy for
saying simply, "should not".

rday
